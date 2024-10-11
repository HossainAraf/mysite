require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Mysite
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.

    # Add Rack::Cors middleware to handle Cross-Origin Resource Sharing (CORS)
    # so that your API can accept requests from other domains
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'  # You can specify domains instead of '*' for more security
        resource '*', 
          headers: :any,
          methods: [:get, :post, :patch, :put, :delete, :options, :head]
      end
    end
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
