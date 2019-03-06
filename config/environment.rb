# Load the Rails application.
require_relative 'application'

app_env_vars = File.join(Rails.root, 'config', 'initializers', 'secrets.rb')
load(app_env_vars) if File.exists?(app_env_vars)

Rails.application.initialize!
