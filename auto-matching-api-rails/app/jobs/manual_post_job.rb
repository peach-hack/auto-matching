class ManualPostJob < ManualJob
  queue_as :default
  MANUAL_POST_CHANNEL = "manual_post_channel".freeze

  def perform(debug_flag, sender_class_s)
    $DEBUG = debug_flag
    klass = sender_class_s.constantize
    @key = klass.new.source_site_key

    AutoMatching::Sender::Executor.new.run(klass)

    set_success
  rescue StandardError
    set_error
  ensure
    $DEBUG = false
  end

  private
    def set_success
      history = SourceSite::ManualPostHistory.find_by(key: @key)
      history.update(last_post_status: SUCCESS, last_post_at: time_now)
      ActionCable.server.broadcast MANUAL_POST_CHANNEL, ids: [history.id], status: SUCCESS
    end

    def set_error
      history = SourceSite::ManualPostHistory.find_by(key: @key)
      history.update(last_post_status: ERROR)
      ActionCable.server.broadcast MANUAL_POST_CHANNEL, ids: [history.id], status: ERROR
    end
end
