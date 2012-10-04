class UserMailer < ActionMailer::Base
  default from: "no-reply@indiemoon.com"

  def welcome_email(user)
    @user = user
    @url = signin_url
    mail(:to => user.email, :subject => "Welcome to Indiemoon")
  end
end
