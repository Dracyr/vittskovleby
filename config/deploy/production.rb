set :stage, :production
set :branch, "master"

# used in case we're deploying multiple versions of the same
# app side by side. Also provides quick sanity checks when looking
# at filepaths
set :deploy_to, "/home/rails/pvpersson"

server '178.62.200.128', user: 'root', roles: %w{web app db}, primary: true
set :nginx_server_name, 'pvpersson.se'
# dont try and infer something as important as environment from
# stage name.
set :rails_env, :production