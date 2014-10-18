# Load DSL and Setup Up Stages
require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/unicorn_nginx'
require 'capistrano/bundler'
require 'capistrano/rbenv'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
Rake::Task[:production].invoke

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
