class UserMailer < ActionMailer::Base
  default from: "Indiemoon <no-reply@indiemoon.com>"

  def welcome_email(user)
    @user = user
    @url = signin_url
    mail(:to => user.email, :subject => "Welcome to Indiemoon")
  end

  def week_events
    allusers = User.all.map {|user| user.email}
    @events = Event.week_events_byday_and_ongoing
    mail(:bcc => allusers, :subject => "Events week #{Date.current.to_s(:short)} to #{(Date.current+7).to_s(:short)}")
  end
end
