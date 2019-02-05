class ManualPostJob < ApplicationJob
  queue_as :default

  SUCCESS = "成功".freeze
  ERROR = "失敗".freeze
  SUSPEND = "抑止".freeze

  def perform(debug_flag, sender_class_s)
    $DEBUG = debug_flag
    klass = sender_class_s.constantize
    @key = klass.new.source_site_key

    history = SourceSite::ManualPostHistory.find_by(key: @key)

    if allow_manual_post?(history)
      AutoMatching::Sender::Executor.new.run(klass)
    else
      raise hogehoge
    end

    set_success
  rescue StandardError
    set_error
    rescue hogehoge
      set_suspend
  ensure
    $DEBUG = false
  end

  private
    def set_success
      history = SourceSite::ManualPostHistory.find_by(key: @key)
      history.update(last_post_status: SUCCESS, last_post_at: date)
      ActionCable.server.broadcast "manual_post_channel", ids: [history.id], status: SUCCESS
    end

    def set_error
      history = SourceSite::ManualPostHistory.find_by(key: @key)
      history.update(last_post_status: ERROR)
      ActionCable.server.broadcast "manual_post_channel", ids: [history.id], status: ERROR
    end

    def set_suspend
      ActionCable.server.broadcast "manual_post_channel", ids: [history.id], status: SUSPEND
    end

    def date
      Time.zone.now
    end

    def allow_manual_post?(history)
      calculate_elapsed_minutes(history) > ENV["NEXT_MANUAL_POST_ALLOW_MINUTES"].to_f && history.last_post_status != "成功"
    end

    def calculate_elapsed_minutes(history)
      elapsed_seconds = date - history.last_post_at
      elapsed_seconds / 60
    end
end
