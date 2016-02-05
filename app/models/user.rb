class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.validate_login_field = false # There is no login field, so don't validate it
    c.login_field = :email          # email is the login field
  end
  
  has_many :ios_quotes
  has_many :mac_quotes
  has_many :assignments
  has_many :roles, :through => :assignments

  validates :first_name,  presence: true, length: { maximum: 50 }
  validates :last_name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, 
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  attr_accessible :email, :login, :first_name, :last_name, :company_name, :job_title, :role_id, :password, :password_confirmation, :active, :remember_me
  
  before_save  :downcase_email
  after_create :assign_role_after_signup # adds default role assignment as specified

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

  def activate
    update_attribute(:active,    true)
    # update_attribute(:activated_at, Time.zone.now)
  end

  def deactivate!
    self.active = false
    save
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self).deliver_now
  end

  def send_activation_instructions!
    reset_perishable_token!
    Notifier.activation_instructions(self).deliver_now
  end

  def send_activation_confirmation!
    reset_perishable_token!
    Notifier.activation_confirmation(self).deliver_now
  end

  def send_new_user_notification!
    Notifier.new_user_notification(self).deliver_now
  end

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end

  def email_address_with_name
    "#{self.login} <#{self.email}>"
  end

  def self.find_by_login_or_email(login)
    find_by_login(login) || find_by_email(login)
  end

  def ensure_role(*role_names)
    if signed_in?
      role_names.push 'admin'
      unless current_user.has_role? *role_names
        flash[:error] = 'You do not have permission to view this page'
        redirect_to actions_index_path
      end
    else
      ensure_signed_in
    end
  end

  private
# Converts email to all lower-case.
  def downcase_email
    self.email = email.downcase
  end
  # Creates and assigns the activation token and digest.
  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  protected
  def assign_role_after_signup
    Assignment.create(:role_id => Role.find_by_name("user").id, :user_id => current_user.id)
  end

end
