# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] = 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rails'
require 'devise'
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  # Include Formulaic
  config.include Formulaic::Dsl, type: :feature
  # Include FactoryGirl
  config.include FactoryGirl::Syntax::Methods

  config.extend SignInHelper#, :type => :controller
  config.include Devise::TestHelpers, :type => :controller
  config.include SignInHelper
  config.include TestsHelper

  Faker::Config.locale = 'sv'


  config.filter_run_excluding :broken => true

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  # These two settings work together to allow you to limit a spec run
  # to individual examples or groups you care about by tagging them with
  # `:focus` metadata. When nothing is tagged with `:focus`, all examples
  # get run.
  #config.filter_run :focus
  config.run_all_when_everything_filtered = true

  # Many RSpec users commonly either run the entire suite or an individual
  # file, and it's useful to allow more verbose output when running an
  # individual spec file.
  if config.files_to_run.one?
    # Use the documentation formatter for detailed output,
    # unless a formatter has already been configured
    # (e.g. via a command-line flag).
    config.default_formatter = 'doc'
  end

  # Remove all files after each run
  config.after :all do
    ActiveRecord::Base.subclasses.each(&:delete_all)
  end


  config.order = :random
  Kernel.srand config.seed

  config.expect_with :rspec do |expectations|
    # Enable only the newer, non-monkey-patching expect syntax.
    # For more details, see:
    #   - http://myronmars.to/n/dev-blog/2012/06/rspecs-new-expectation-syntax
    expectations.syntax = :expect
  end
end
