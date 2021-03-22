require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SampleApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

# Load ENV variables from credentials.yml file
config.before_configuration do
  env_file = File.join(Rails.root, 'config', 'credentials.yml')
  YAML.load(File.open(env_file))[Rails.env].each do |key, value|
    ENV[key.to_s] = value
  end if File.exists?(env_file)
end
  # Include the authenticity token in remote forms.
  config.action_view.embed_authenticity_token_in_remote_forms = true 
  end
end
