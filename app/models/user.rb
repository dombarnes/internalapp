class User < ActiveRecord::Base  
  acts_as_authentic
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  # relationships
  has_many :ios_quotes
  has_many :mac_quotes
  has_many :roles_users
  has_many :roles, :through => :roles_users
  before_create :setup_role
  attr_accessible :email, :login, :first_name, :last_name, :role_id, :password, :password_confirmation, :active
  
  def deliver_password_reset_instructions!  
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end
    
  def active?
    active
  end

  def activate!
    self.active = true
    save(:validate => false)
  end

  def deactivate!
    self.active = false
    save
  end

  def send_activation_instructions!
    reset_perishable_token!
    Notifier.activation_instructions(self).deliver
  end

  def send_activation_confirmation!
    reset_perishable_token!
    Notifier.activation_confirmation(self).deliver
  end

  def email_address_with_name
    "#{self.login} <#{self.email}>"
  end
  
  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end
    
#  def has_role?(role_sym)
#    self.roles.count(:conditions => ['name = ?', role]) > 0
##    roles.any? { |r| r.name.underscore.to_sym ==role_sym}
#  end
  
  def add_role
    return if self.has_role?(role)
    self.roles << Role.find_by_name(role)
  end

  def role?(role)
   return !!self.roles.find_by_name(role.to_s)
  end
   
#  def role?(role)
#    roles.include? role.to_s
#  end

  def self.find_by_login_or_email(login)
    find_by_login(login) || find_by_email(login)
  end

# for assignment of roles
#  def role_ids=(ids)
#    self.roles.clear
#  ids.delete_if{|i| i.empty?}.each do |id|
#    self.roles << Role.get(id)
#    end
#  end
#
#  def has_role?(role_sym)
#    roles.any? { |r| r.name.underscore.to_sym == role_sym }
#  end
#
#  def role?(role)
#    return !!self.roles.first(:name => role.to_s.camelize)
#  end
###

private
    def setup_role
      if self.role_ids.empty?
        self.role_ids = [4]
    end
  end
end