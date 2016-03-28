class UserNotifier < ActionMailer::Base
default_url_options[:host] = "example.com"
default from: "noreply@example.com"

  def password_reset_instructions(user)
    from:         "Binary Logic Notifier "    
    mail(subject: "Password Reset Instructions",
      recipients:   user.email,
      sent_on:      Time.now,
      body:         :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
      )
  end

  def activation_instructions(user)
      from: "Binary Logic Notifier <noreply@example.com>"
      @account_activation_url = activate_account_url(user.perishable_token)
      mail(to: user.email_address_with_name,
           subject: "Activation Instructions",
           from: from,
           fail_to: from
      ) do |format|
        format.html
      end
    end

    def activation_confirmation(user)
      from:          "Binary Logic Notifier <noreply@example.com>"
      mail(:to => user.email_address_with_name,
           :subject => "Activation Complete",
           :from => from,
           :fail_to => from
      ) do |format|
        format.html
      end
    end

    def new_user_notification(user)
      @user = user
        from:      "Binary Logic Notifier <noreply@domain.com>"
        mail( :to => "#{user.email}",
              :subject => "New User Registration",
              :from => from,
              :fail_to => from
            ) do |format|
          format.html
        end
    end

    def send_reseller_quote
      from    "info@example.com"
      attachments[]
      mail( :to => user.email,
            :subject => "iOS Quote for <%= @ios_quote.company_name %>"
      )
    end
end
