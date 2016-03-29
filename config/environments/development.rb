Rails.application.configure do
    config.cache_classes = false
    config.eager_load = false
    config.consider_all_requests_local = true
    config.i18n.fallbacks = false
    config.action_controller.perform_caching = false
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.perform_deliveries = true
    # Send emails to mailcatcher
    config.action_mailer.default_url_options = { :host => "localhost:5000" }
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = { :address => "127.0.0.1", :port => 1025, :domain => "internalapp.dev" }
    config.action_mailer.default_url_options = { host: "127.0.0.1:5000" }
    # Send emails to letter_opener
    # config.action_mailer.delivery_method = :letter_opener
    config.active_support.deprecation = :log
    config.active_record.migration_error = :page_load
    config.assets.debug = true
    config.assets.digest = true
    config.assets.raise_runtime_errors = true
    # config.action_view.raise_on_missing_translations = true
end
