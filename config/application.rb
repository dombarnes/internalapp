require File.expand_path('../boot', __FILE__)
require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)
module Internalapp
  class Application < Rails::Application
    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = 'en-GB'
    config.assets.paths << "#{Rails}/vendor/assets/fonts"
    config.assets.precompile += %w( *.eot *.svg *.ttf *.woff *.woff2 )
    # Required for Heroku
    config.assets.initialize_on_precompile = false
    config.serve_static_files = true
    config.encoding = "utf-8"

    config.autoload_paths += %W(#{config.root}/lib)
    config.active_job.queue_adapter = :resque
    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

  end
end
