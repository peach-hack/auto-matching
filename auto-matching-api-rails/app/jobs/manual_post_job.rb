class ManualPostJob < ManualJob
  queue_as :default

  MANUAL_POST_CHANNEL = "manual_post_channel".freeze

  def perform(debug_flag, sender_class_s)
    $DEBUG = debug_flag
    klass = sender_class_s.constantize
    key = klass.new.source_site_key
    channel = MANUAL_POST_CHANNEL

    history = SourceSite::ManualPostHistory.find_by(key: @key)

    if allow_manual_post?(history)
      AutoMatching::Sender::Executor.new.run(klass)
      set_success
    else
      set_suspend
    end

    set_success(key, channel)
  rescue StandardError => e
    set_error(key, channel)
    raise e
  ensure
    $DEBUG = false
  end
  private

    def allow_manual_post?(history)
      (calculate_elapsed_minutes(history) > ENV["NEXT_MANUAL_POST_ALLOW_MINUTES"].to_f) || history.last_post_status != SUCCESS
    end

    def calculate_elapsed_minutes(history)
      elapsed_seconds = time_now - history.last_post_at
      elapsed_seconds / 60
    end
end
