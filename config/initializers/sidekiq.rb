Sidekiq.configure_server do |config|
  config.redis = { :url => 'redis://localhost:6379/12', :namespace => ENV['REDIS_NAMESPACE'] }
end

Sidekiq.configure_client do |config|
  config.redis = { :url => 'redis://localhost:6379/12', :namespace => ENV['REDIS_NAMESPACE'] }
end
