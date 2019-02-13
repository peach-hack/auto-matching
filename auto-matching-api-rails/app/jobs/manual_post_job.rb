class ManualPostJob < ManualJob
  MANUAL_POST_CHANNEL = "manual_post_channel".freeze

  def perform(debug_flag, sender_class_s)
    $DEBUG = debug_flag
    klass = sender_class_s.constantize
    key = klass.new.source_site_key
    channel = MANUAL_POST_CHANNEL

    AutoMatching::Sender::Executor.new.run(klass)

    set_success(key, channel)
  rescue StandardError => e
    set_error(key, channel)
    raise e
  ensure
    $DEBUG = false
  end
end
