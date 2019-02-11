class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru <gudzy.funky@gmail.com>"}
  layout 'mailer'
end
