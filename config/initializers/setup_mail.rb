ActionMailer::Base.smtp_settings = {
  :address  => "smtp.sendgrid.net",
  :port  => 25,
  :user_name  => "info@class.io",
  :password  => "evomorales",
  :authentication  => :login
}

ActionMailer::Base.default_url_options[:host] = "indiemoon.com"
