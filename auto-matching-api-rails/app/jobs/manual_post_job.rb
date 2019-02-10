class ManualPostJob < ManualJob
  queue_as :default

  def perform(debug_flag, sender_class_s)
    $DEBUG = debug_flag
    klass = sender_class_s.constantize
    @key = klass.new.source_site_key

    history = SourceSite::ManualPostHistory.find_by(key: @key)

    if allow_manual_post?(history)
      AutoMatching::Sender::Executor.new.run(klass)
      set_success
    else
      set_suspend
    end

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

    def set_suspend
      ActionCable.server.broadcast MANUAL_POST_CHANNEL, ids: [history.id], status: SUSPEND
    end

    def allow_manual_post?(history)
      calculate_elapsed_minutes(history) > ENV["NEXT_MANUAL_POST_ALLOW_MINUTES"].to_f || history.last_post_status != SUCCESS
    end

    def calculate_elapsed_minutes(history)
      elapsed_seconds = time_now - history.last_post_at
      elapsed_seconds / 60
    end
end
