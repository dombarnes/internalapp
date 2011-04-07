class User < ActiveRecord::Base
  acts_as_authentic
  
  def deliver_password_reset_instructions!  
  reset_perishable_token!  
  Notifier.deliver_password_reset_instructions(self)  
  end
    
  def active?
    active
  end

  def activate!
    self.active = true
    save
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
end
