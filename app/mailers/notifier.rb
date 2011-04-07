class Notifier < ActionMailer::Base
  
  def activation_instructions(user)
    from          "Binary Logic Notifier <noreply@macbyte.co.uk>"
    
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
    from          "Binary Logic Notifier <noreply@macbyte.co.uk>"
    
    mail(:to => user.email_address_with_name,
         :subject => "Activation Complete",
         :from => from,
         :fail_to => from
    ) do |format|
      format.text
    end
  end

end