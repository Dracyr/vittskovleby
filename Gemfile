source 'https://rubygems.org'

ruby '2.2.3'

gem 'rails', '4.2.0'
gem 'bcrypt', '~> 3.1.7'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'haml'
gem 'autoprefixer-rails'
gem 'simple_form', '>= 3.1.0.rc1'
gem 'responders'
gem 'devise'
gem 'cancancan', '~> 1.9'
gem 'dotenv-rails'
gem 'codemirror-rails'
gem 'font-awesome-sass', '~> 4.3.0'
gem 'acts_as_list'
gem 'dragonfly', '~> 1.0.12'
gem 'dragonfly-s3_data_store' # Store images on s3
gem 'rails_bootstrap_navbar'
gem 'remotipart', '~> 1.2' #Ajax file uploads
gem 'bootstrap_form'
gem 'icheck-rails'
gem 'newrelic_rpm'
gem 'momentjs-rails' #Required by fullcalendar, datetimepicker
gem 'fullcalendar-rails'
gem 'bootstrap3-datetimepicker-rails', '~> 4.7.14'
gem 'validates_overlap'
gem 'select2-rails'
gem 'dalli'

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

gem 'factory_girl_rails', :group => [:development, :test]
gem 'rspec-rails', '~> 3.0.0', :group => [:development, :test]

group :production do
  gem 'unicorn'
  gem 'rack-cache', :require => 'rack/cache'
  gem 'rails_12factor' # Heroku
end
