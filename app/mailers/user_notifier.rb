class UserNotifier < ApplicationMailer

  def add_logo!
    attachments.inline['logo.jpg'] = File.read(Rails.root.join('app/assets/images/logo.jpg'))
  end  

  def password_reset_instructions(user)
    add_logo!
    @edit_password_reset_url = edit_password_reset_url(user.perishable_token)
    mail(to: user.email_address_with_name,
      subject: "Password Reset Instructions",
      sent_on: Time.now,
      content_type: "text/html"
      )
  end

  def activation_instructions(user)
    add_logo!
    @account_activation_url = activate_account_url(user.perishable_token)
    mail(to: user.email_address_with_name,
      subject: "Activation Instructions",
      )
  end

  def activation_confirmation(user)
    add_logo!
    mail(:to => user.email_address_with_name,
         :subject => "Activation Complete"
    )
  end

  def new_user_notification(user)
    @user = user
    add_logo!
    mail(to: "#{@user.email}",
      subject: "New User Registration"
      )
  end

  def send_reseller_quote
    add_logo!
    mail(to: user.email,
      subject: "iOS Quote for <%= @ios_quote.company_name %>"
    )
  end
end
