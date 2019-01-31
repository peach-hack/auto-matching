REDIS ||= Redis.new(url: ENV["REDIS_URL"] || "redis://localhost:6379") if Rails.env.development?
REDIS ||= Redis.new(url: ENV["REDISTOGO_URL"] || "redis://localhost:6379") if Rails.env.production?
