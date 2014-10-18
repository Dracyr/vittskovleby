# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'pvpersson'
set :deploy_user, 'rails'
set :rbenv_ruby, '2.1.3'
set :rvm_ruby_version, '2.1.3'
set :keep_releases, 1
set :linked_files, %w{config/database.yml .env}
set :repo_url, 'git@github.com:Dracyr/pvpersson.git'
set :scm, :git
set :format, :pretty

namespace :deploy do
  after :finishing, 'deploy:cleanup'

  # As of Capistrano 3.1, the `deploy:restart` task is not called
  # automatically.
  after 'deploy:publishing', 'deploy:restart'
end
