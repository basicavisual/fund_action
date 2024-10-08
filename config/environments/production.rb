# require 'syslog/logger'

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Attempt to read encrypted secrets from `config/secrets.yml.enc`.
  # Requires an encryption key in `ENV["RAILS_MASTER_KEY"]` or
  # `config/secrets.yml.key`.
  # config.read_encrypted_secrets = true

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = Uglifier.new(:harmony => true)
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # `config.assets.precompile` and `config.assets.version` have moved to config/initializers/assets.rb

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.action_controller.asset_host = 'http://assets.example.com'

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = 'X-Sendfile' # for Apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for NGINX

  # Mount Action Cable outside main process or domain
  # config.action_cable.mount_path = nil
  # config.action_cable.url = 'wss://example.com/cable'
  # config.action_cable.allowed_request_origins = [ 'http://example.com', /http:\/\/example.*/ ]

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  instance_name = ENV.fetch('INSTANCE_NAME'){ "fundaction" }

  # Logging
  #

  # Use the lowest log level to ensure availability of diagnostic information
  # when problems arise.
  config.log_level = :info

  #config.logger = Syslog::Logger.new("rails_#{instance_name}", Syslog::LOG_LOCAL6)
#  if ENV["RAILS_LOG_TO_STDOUT"].present?
#    logger           = ActiveSupport::Logger.new(STDOUT)
#    logger.formatter = config.log_formatter
#    config.logger    = ActiveSupport::TaggedLogging.new(logger)
#  end
config.log_formatter = ::Logger::Formatter.new
  # Prepend all log lines with the following tags.
  config.log_tags = [ :request_id ]

  config.action_mailer.logger = nil


  # Rails cache configuration
  #

  # Prefix cache keys with deployed git revision (stored in REVISION on
  # production servers), so we do not need to clear the cache after
  # deployments.
  revision = File.read(Rails.root/"REVISION").chomp rescue "63b178c"

  memcached_servers = ENV.fetch('MEMCACHED_SERVERS'){ "127.0.0.1:11211" }.split
  concurrency       = ENV.fetch('NUM_THREADS'){ 5 }
  #config.cache_store = :mem_cache_store, *memcached_servers, { namespace: "#{instance_name}:#{revision}:default", pool_size: concurrency }
  config.cache_store = :mem_cache_store, "127.0.0.1:11211", { pool_size: 5, pool_timeout: 5 }
  #config.cache_store = :memory_store, { size: 64.megabytes }
  # Use a real queuing backend for Active Job (and separate queues per environment)
  config.active_job.queue_adapter     = :delayed_job
  config.action_mailer.perform_caching = false

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :log

  # config.action_mailer.delivery_method = :sendmail
  config.action_mailer.delivery_method = :smtp
  #config.action_mailer.smtp_settings = YAML.load(IO.read(Rails.root/"config/smtp_settings.yml")).symbolize_keys

  config.action_mailer.default_url_options ||= {}
  config.action_mailer.default_url_options[:protocol] = 'https'
  config.action_mailer.default_url_options[:host] = 'assembly.fundaction.eu'

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false
end
