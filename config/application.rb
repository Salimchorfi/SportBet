require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SportBet
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.paths.add File.join("app", "bot"), glob: File.join("**","*.rb")
    config.autoload_paths += Dir[Rails.root.join("app", "bot", "*")]

    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += Dir["#{config.root}/lib/**/"]

    config.time_zone = 'Eastern Time (US & Canada)'
    config.active_record.default_timezone = :local
  end
end
