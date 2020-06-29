class UserMailer < ApplicationMailer
  default from: 'sweatclause@gmail.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end

  def signup_confirmation(user)
    @user = user

    mail to: user.email, subject: "Sign up confirmation"
  end 
end
