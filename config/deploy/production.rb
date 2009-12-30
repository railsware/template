set :application, "PUT_YOUR_NAME_HERE"
set :god_group, "PUT_YOUR_NAME_HERE"
set :rails_env, "production"

set :domain, "PUT_YOUR_ADDRESS_HERE"
role :app, domain
role :web, domain
role :db, domain, :primary => true

#set :branch, "default"

set :app_server, :passenger
set :use_sudo, false

set :user, 'deployer'
set :password, 'PUT_YOUR_PASSWORD_HERE'
set :deploy_to, "/var/data/www/apps/#{application}"
