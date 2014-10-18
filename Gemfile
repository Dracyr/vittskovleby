source 'https://rubygems.org'

gem 'rails', '4.1.1'
gem 'bcrypt', '~> 3.1.7'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'haml'
gem 'autoprefixer-rails'
gem 'simple_form', '>= 3.1.0.rc1'
gem 'responders'
gem 'devise'
gem 'cancancan', '~> 1.9'

group :development do
 	gem 'capistrano-rails'
 	gem 'capistrano-unicorn-nginx', '~> 3.1.0'
 	gem 'capistrano-bundler', '~> 1.1.2'
 	gem 'capistrano-rbenv'
	gem 'spring'
  gem 'guard-rspec', require: false
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem 'capybara'
  gem 'shoulda-matchers', require: false
  gem 'formulaic'
  gem 'faker'
  gem 'fuubar'
end

gem 'factory_girl_rails', :group => [:development, :test]
gem 'rspec-rails', '~> 3.0.0', :group => [:development, :test]

group :production do
	gem 'unicorn'
end
