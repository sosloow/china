# config valid only for Capistrano 3.1
lock '3.1.0'

dpath = "/home/hosting_sbgroup/projects/china"

set :application, 'china'
set :repo_url, 'git@github.com:sosloow/china.git'
set :rails_env, "production"
set :user, "hosting_sbgroup"
set :use_sudo, false
set :deploy_to, dpath

set :scm, :git
set :branch, "master"
set :deploy_via, :remote_cache

role :web, "china.sbgroup.lclients.ru"                          # Your HTTP server, Apache/etc
role :app, "china.sbgroup.lclients.ru"                          # This may be the same as your `Web` server
role :db,  "china.sbgroup.lclients.ru", :primary => true # This is where Rails migrations will run

# after "deploy:update_code", :copy_database_config

# task :copy_database_config, roles => :app do
#   db_config = "#{shared_path}/database.yml"
#   run "cp #{db_config} #{release_path}/config/database.yml"
# end

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
