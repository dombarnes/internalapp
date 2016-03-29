class ApplicationMailer < ActionMailer::Base
  default from: 'internalapp@localhost'
  layout 'mailer'
end
