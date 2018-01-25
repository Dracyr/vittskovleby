source 'https://rubygems.org'

ruby '2.5.0'

gem 'rails', '5.1.0'
gem 'pg', '~> 0.20'
gem 'sass-rails', '~> 5.0.7'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'uglifier', '~> 4.1.4'
gem 'coffee-rails', '~> 4.2.2'
gem 'jquery-rails'
gem 'turbolinks'
gem 'haml'
gem 'autoprefixer-rails'
gem 'simple_form', '~> 3.5.0'
gem 'responders'
gem 'devise'
gem 'cancancan', '~> 2.1.3'
gem 'dotenv-rails'
gem 'codemirror-rails'
gem 'font-awesome-sass', '~> 4.7.0'
gem 'acts_as_list'
gem 'dragonfly', '~> 1.1.4'
gem 'dragonfly-s3_data_store' # Store images on s3
gem 'rails_bootstrap_navbar'
gem 'remotipart', '~> 1.3' #Ajax file uploads
gem 'bootstrap_form'
gem 'icheck-rails'
gem 'newrelic_rpm'
gem 'momentjs-rails' #Required by fullcalendar, datetimepicker
gem 'fullcalendar-rails'
gem 'bootstrap3-datetimepicker-rails', '~> 4.7.14'
gem 'validates_overlap'
gem 'select2-rails'
gem 'dalli'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'mime-types'

group :development do
  gem 'spring'
  gem 'guard-rspec', require: false
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'meta_request'
  gem 'awesome_print'
end

group :test do
  gem 'capybara'
  gem 'formulaic'
  gem 'faker'
  gem 'fuubar'
end

group :development, :test do
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.7.2'
end

group :production do
  gem 'unicorn'
  gem 'rack-cache', :require => 'rack/cache'
  gem 'rails_12factor' # Heroku
end
