class Signup < ActionMailer::Base
  default from: 'no-repley@colcho.net'

  def confirm_email(user)
    @user = user
    @confirmation_link = confirmation_url({
        toke: @user.confirmation_toke 
      })

    mail({
        to: user.email,
        bcc: ['sign ups <signup@colcho.net>'],
        subject: I18n.t('signup.confirm_email.subject')})
  end
end
