source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'compass-rails', '~> 1.0.3'
  gem 'zurb-foundation', '~> 3.0.9'
  gem 'therubyracer'
  gem 'font-awesome-sass-rails'
end

gem 'jquery-rails'
gem 'thin'
gem 'haml-rails'
gem 'high_voltage', ">= 1.2.0"
gem 'rdiscount'
gem 'unicorn'
gem 'clearance'
gem 'omniauth'
gem 'omniauth-twitter'
gem "nvd3-rails", :git => "git@github.com:adeven/nvd3-rails.git", :submodules => true


group :development do
  gem 'heroku'
  gem 'foreman'
  gem 'capistrano-deploy', :require => false
  gem 'capistrano-campfire', :require => false
end

group :development, :test do
  gem 'rspec-rails', '~> 2.9.0'
  gem 'dotenv'
  gem 'pry'
end

group :test do
  gem 'cucumber-rails', '1.3.0', :require => false
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'timecop'
  gem 'shoulda-matchers'
  gem 'launchy'
end

group :staging, :production do
  gem 'newrelic_rpm'
end


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
