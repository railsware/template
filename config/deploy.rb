require 'capistrano/ext/multistage'

set :stages, %w(staging production)
set :default_stage, "staging"
set :branch, "default"
set :scm, :mercurial
set :scm_verbose, false
set :repository,  "ssh://hg@bitbucket.org/railsware/PUT_YOUR_NAME_HERE/"

ssh_options[:forward_agent] = true
default_run_options[:pty] = true

set :keep_releases, 5

#this block is fix of strange process/reaper error during deployment.
deploy.task :restart do
  run "touch #{current_path}/tmp/restart.txt"
end

# when code was updated we need to add symlinks to the static data like uploaded files, application configuration and so on...
deploy.task :after_update_code do
  run "ln -s #{deploy_to}/#{shared_dir}/config/local_initializer.rb #{current_release}/config/initializers/local_initializer.rb"
  run "ln -s #{deploy_to}/#{shared_dir}/config/database.yml #{current_release}/config/database.yml"
  #run "ln -s #{deploy_to}/#{shared_dir}/log #{current_release}/"
  run "cd #{current_release}/ && rake db:migrate RAILS_ENV=#{rails_env}"
end

after "deploy:symlink"

namespace :maintenance do
  desc "Reboot the server"
  task :reboot do
    sudo "reboot"
  end

  desc "Show hostname"
  task :uname do
    run "uname -a"
  end

  namespace :gems do
    desc "Install all required GEMs"
    task :install do
      sudo "RAILS_ENV=#{rails_env} rake -f #{current_path}/Rakefile gems:install"
    end

    desc "List installed gems"
    task :list do
      run "gem list"
    end

    desc "Update installed gems"
    task :update do
      sudo "gem update"
    end

    desc "Install gem"
    #cap staging maintenance:gems:installgem -S whatgem=rails
    task :installgem do
      sudo "gem install #{whatgem}"
    end
  end
end
