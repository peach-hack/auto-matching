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
    else
      raise hogehoge
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
      # TODO: 投稿制限条件を強める考慮
      calculate_elapsed_minutes(history) > ENV["NEXT_MANUAL_POST_ALLOW_MINUTES"].to_f || history.last_post_status != "成功"
    end

    def calculate_elapsed_minutes(history)
      elapsed_seconds = date - history.last_post_at
      elapsed_seconds / 60
    end
end
