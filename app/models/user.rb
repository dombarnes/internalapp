class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::BCrypt
    c.logged_in_timeout = 20.minutes # default is 10.minutes
  end
  # has_secure_password
  has_many :ios_quotes
  has_many :mac_quotes
  has_many :roles, through: :role_users
  has_many :role_users
  
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save  :downcase_email
  before_create :create_activation_digest
  
  validates :first_name,  presence: true, length: { maximum: 50 }
  validates :last_name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, 
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def to_s
    [first_name, last_name].join(' ')
  end
  
  def role_symbols
    (roles || []).map {|r| r.title.to_sym}
    # if role
    #     [role.title.downcase.to_sym]
    # else
    #   [:guest]
    # end  
  end
  
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def active?
    active
  end

  def activate!
    self.active = true
    save
    # update_attribute(:activate, true)
    # update_attribute(:activated_at, Time.zone.now)
  end

  def deactivate!
    self.active = false
    save
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    UserNotifier.password_reset_instructions(self).deliver_now
  end

  def send_activation_instructions!
    reset_perishable_token!
    UserNotifier.activation_instructions(self).deliver_now
  end

  def send_activation_confirmation!
    reset_perishable_token!
    UserNotifier.activation_confirmation(self).deliver_now
  end

  def send_new_user_notification!
    UserNotifier.new_user_notification(self).deliver_now
  end

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  def email_address_with_name
    "#{self.login} <#{self.email}>"
  end

  def self.find_by_login_or_email(login)
    find_by_login(login) || find_by_email(login)
  end

private
# Converts email to all lower-case.
  def downcase_email
    self.email = email.downcase
  end
  # Creates and assigns the activation token and digest.
  def create_activation_digest
    self.activation_token  = User.new_token
    self.perishable_token = User.digest(activation_token)
  end
end
