require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FreshFinder
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

   config.before_configuration do
      if Rails.env.test?
        local_env_file_name = ENV["LOCAL_ENV_FILE"] || 'local_env.test.yml'
        local_env_file = File.join(Rails.root, 'config', local_env_file_name)
      else
        local_env_file_name = ENV["LOCAL_ENV_FILE"] || 'local_env.yml'
        local_env_file = File.join(Rails.root, 'config', local_env_file_name)
      end
      YAML.load(File.open(local_env_file)).each do |key, value|
        ENV[key.to_s] = value.to_s
      end if File.exists?(local_env_file)
    end
        
    
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
