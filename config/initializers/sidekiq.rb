# frozen_string_literal: true

require 'sidekiq'

Sidekiq.configure_client do |config|
  # accepts :expiration (optional)
  config.redis = {
    url: 'redis://127.0.0.1:6379/0'
  }
end

Sidekiq.configure_server do |config|
  # accepts :expiration (optional)
  config.redis = {
    url: 'redis://127.0.0.1:6379/0'
  }
end
