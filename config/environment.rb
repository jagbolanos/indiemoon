# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Indiemoon::Application.initialize!

Indiemoon::Application.configure do
   config.action_mailer.default_url_options = { :host => "indiemoon.com" }
   config.action_mailer.delivery_method = :smtp
   config.action_mailer.raise_delivery_errors = true
end
