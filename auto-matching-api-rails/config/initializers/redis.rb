REDIS ||= Redis.new(url: ENV["REDIS_PROVIDER"] || "redis://localhost:6379")
