# config valid only for Capistrano 3.1
lock '3.2.1'
set :application, 'pvpersson'
set :deploy_user, 'rails'

set :stages, 'production'
set :default_stage, "production"
set :keep_releases, 1
set :linked_files, %w{config/database.yml}

set :repo_url, 'git@github.com:Dracyr/pvpersson.git'
set :scm, :git

set :format, :pretty

namespace :deploy do
  # make sure we're deploying what we think we're deploying
  before :deploy, "deploy:check_revision"
  # only allow a deploy with passing tests to deployed
  before :deploy, "deploy:run_tests"
  # compile assets locally then rsync
  after :finishing, 'deploy:cleanup'

  # As of Capistrano 3.1, the `deploy:restart` task is not called
  # automatically.
  after 'deploy:publishing', 'deploy:restart'
end
