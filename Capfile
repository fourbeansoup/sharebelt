require 'capistrano-deploy'
require 'capistrano/campfire'
use_recipes :git, :bundle, :rails, :unicorn, :rails_assets

server 'sharebelt.com', :web, :app, :db, :primary => true
set :user, 'deploy'
set :deploy_to, '/home/deploy/sharebelt/current'
set :repository, 'git@github.com:railsrumble/r12-team-462.git'

set :campfire_options, :account => 'sharebelt',
                       :room => 'Coding',
                       :token => 'd54ab05b956b82cab28cb9f4d34c665dda32680d',
                       :ssl => true


ssh_options[:forward_agent] = true

before 'deploy:update', 'deploy:pre_notice'
after 'deploy:update', 'bundle:install'
after 'deploy:update', 'deploy:assets:precompile'
after 'deploy:update', 'deploy:post_notice'
after 'deploy:restart', 'unicorn:reload'

namespace :deploy do
  desc "Set up the unicorns"
  task :unicorn_power, :roles => :db do
    run "mkdir #{deploy_to}/tmp/pids/"
    run "mkdir #{deploy_to}/tmp/sockets/"
    run "cd #{deploy_to} && bundle exec unicorn -c #{deploy_to}/config/unicorn.rb -E production -D"
  end

  desc "Tell campfire we're done"
  task :pre_notice do
    campfire_room.speak "#{ENV['USER']} started deploying"
  end
  desc "Tell campfire we're done"
  task :post_notice do
    campfire_room.speak "#{ENV['USER']} finished deploying"
  end
end

