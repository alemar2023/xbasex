# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

=begin
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.smtp_settings = {
  address:         'smtp.gmail.com',
  port:            465,
  domain:          'gmail.com',
  user_name:       ENV['DEV_USER'],
  password:        ENV['DEV_PWD'],
  authentication:  'plain',
  :ssl => true,
  :tsl => true,
  enable_starttls: true,
  open_timeout:    5,
  read_timeout:    5 }
=end
