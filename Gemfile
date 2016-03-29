source 'https://rubygems.org'
ruby '2.3.0'

gem 'rails', '~> 4.2.6'
gem 'pg'
gem 'bootstrap-sass'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'bcrypt'
gem 'faker'
gem 'carrierwave'
gem 'mini_magick'
gem 'delayed_job_active_record'
gem 'resque'
gem 'resque-scheduler'

#Custom Additions
gem 'authlogic' # User Authentication
# gem 'cancancan', '~> 1.10' # User Authorization
gem 'declarative_authorization', github: "stffn/declarative_authorization"
gem 'ruby_parser' 

gem 'fog' # cloud services library
gem 'twitter-bootstrap-rails', github: 'seyhunak/twitter-bootstrap-rails'
gem 'will_paginate',           '~> 3.1.0'
gem 'bootstrap-will_paginate' # pagination layout
gem 'puma', '~> 3.1.1' # Web Server for Heroku

gem 'prawn' # PDF generator
gem 'prawnto' #for PDF invoices and quotes
gem 'prawn-table'
gem 'pdfkit' #for PDF invoices and quotes

# gem 'therubyracer', platforms: :ruby

gem 'sdoc', '~> 0.4.0', group: :doc

group :development do
	gem 'rack-mini-profiler'
	# gem 'capistrano-rails
  gem 'web-console', '~> 2.0'
  gem 'rails_layout'
  gem 'quiet_assets'
  gem 'rails-erd'
  gem "spring"
  gem "spring-commands-rspec"
  gem 'seed_dump'
end

group :development, :test do
	gem "awesome_print"
  gem "bundler-audit", require: false
  gem "byebug"
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.3.0"
end

group :test do
	gem "capybara-webkit", ">= 1.2.0"
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers", require: false
  gem "simplecov", require: false
  gem "timecop"
  gem "webmock"
end

group :production do	
end
