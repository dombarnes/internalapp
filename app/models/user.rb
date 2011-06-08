class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.login_field = :email          # email is the login field
    c. validate_login_field = false # There is no login field, so don't validate it
  end

  # relationships
  has_many :ios_quotes
  has_many :mac_quotes
  has_many :roles_users
  has_many :roles, :through => :roles_users

  attr_accessible :email, :login, :first_name, :last_name, :company_name, :job_title, :role_id, :password, :password_confirmation, :active, :remember_me
      
  def active?
    active
  end

  def activate!
    self.active = true
    save #(:validate => false)
  end

  def deactivate!
    self.active = false
    save
  end

  def deliver_password_reset_instructions!  
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end

  def send_activation_instructions!
    reset_perishable_token!
    Notifier.activation_instructions(self).deliver
  end

  def send_activation_confirmation!
    reset_perishable_token!
    Notifier.activation_confirmation(self).deliver
  end

  ### AuthLogic/CanCan Code
#  ROLES = %w[admin staff standard]
#
#  def roles=(roles)
#    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
#  end

#  def roles
#    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
#  end

#  def role?(role)
#    roles.include? role.to_s
#  end
  
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

end