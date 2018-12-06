class AutoPostingJob < ApplicationJob
  queue_as :default

  def perform(*args)
    rake "daily_post:all"
  end
end
