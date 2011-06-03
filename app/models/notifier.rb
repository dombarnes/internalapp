class Notifier < ActionMailer::Base  
default_url_options[:host] = "example.com"
  
  def password_reset_instructions(user)  
    subject       "Password Reset Instructions"  
    from          "Binary Logic Notifier "  
    recipients    user.email  
    sent_on       Time.now  
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)  
  end  

  def activation_instructions(user)
      from          "Binary Logic Notifier <noreply@example.com>"

      @account_activation_url = activate_account_url(user.perishable_token)
      mail(:to => user.email_address_with_name,
           :subject => "Activation Instructions",
           :from => from,
           :fail_to => from
      ) do |format|
        format.text
      end
    end

    def activation_confirmation(user)
      from          "Binary Logic Notifier <noreply@example.com>"
      mail(:to => user.email_address_with_name,
           :subject => "Activation Complete",
           :from => from,
           :fail_to => from
      ) do |format|
        format.text
      end
    end

end