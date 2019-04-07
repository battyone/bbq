source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'dotenv-rails', require: 'dotenv/rails-now'
gem 'rails', '~> 5.2.2'
gem 'pg'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'haml-rails', '~> 1.0'
gem 'bootstrap-sass', '~> 3.4.1'
gem 'sassc-rails', '>= 2.1.0'
gem 'devise'
gem 'devise-i18n'
gem 'faker'
gem 'carrierwave', '~> 1.0'
gem 'rmagick'
gem 'fog-aws'
gem 'pundit', '2.0.0'
gem 'resque', '~> 1.27.4'
gem 'omniauth'
gem 'omniauth-facebook'

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails', '~> 3.4'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'capistrano', '~> 3.11.0'
  gem 'capistrano-rails', '~> 1.3.0'
  gem 'capistrano-passenger', '~> 0.2'
  gem 'capistrano-rbenv', '~> 2.1'
  gem 'capistrano-bundler', '~> 1.4.0'
  gem 'capistrano-resque', '~> 0.2.3', require: false
end

group :test do
  gem 'capybara'
  gem 'launchy'
end
