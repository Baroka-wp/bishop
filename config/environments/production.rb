require 'devise'
Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  config.assets.compile = false
  config.active_storage.service = :local
  config.log_level = :debug
  config.log_tags = [:request_id]
  config.action_mailer.perform_caching = false
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.force_ssl = false
  config.log_formatter = ::Logger::Formatter.new
  config.require_master_key = true
  if ENV['RAILS_LOG_TO_STDOUT'].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  config.active_record.dump_schema_after_migration = false

  #config.action_mailer.delivery_method = :smtp
  #host = 'localhost:3000' # replace with your own url

  # SMTP settings for gmail
  #config.action_mailer.smtp_settings = {
  #  address: 'smtp.gmail.com',
  #  port: 587,
  #  user_name: 'birotori@gmail.com',
  #  password: ENV['GOOGLE_PWD'],
  #  authentication: 'plain',
  #  enable_starttls_auto: true
  #}
end
