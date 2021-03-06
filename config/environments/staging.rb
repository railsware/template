# Settings specified here will take precedence over those in config/environment.rb

# The production environment is meant for finished, "live" apps.
# Code is not reloaded between requests
config.cache_classes = true

# Full error reports are disabled and caching is turned on
config.action_controller.consider_all_requests_local = false
config.action_controller.perform_caching             = true
config.action_view.cache_template_loading            = true

# See everything in the log (default is :info)
# config.log_level = :debug

# Use a different logger for distributed setups
# config.logger = SyslogLogger.new

# Use a different cache store in production
# config.cache_store = :mem_cache_store

# Enable serving of images, stylesheets, and javascripts from an asset server
# config.action_controller.asset_host = "http://assets.example.com"

# Enable threaded mode
# config.threadsafe!

# Don't care if the mailer can't send
config.action_mailer.raise_delivery_errors = false

# send mail thru Google on staging & development
#config.action_mailer.delivery_method = :smtp
#config.action_mailer.smtp_settings = {
#  :address  => "smtp.gmail.com",
#  :port  => 587,
#  :authentication  => :plain,
#  :user_name  => "username",
#  :password  => "password"
#}
config.action_mailer.delivery_method = :sendmail
