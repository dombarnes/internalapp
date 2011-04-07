ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => 'gmail.com',
  :user_name => 'dom@macbyte.co.uk',
  :password => 'highlands16',
  :authentication => 'plain',
  :enable_starttls_auto => true
}
