class ManualPostJob < ApplicationJob
  queue_as :default

  SUCCESS = "成功".freeze
  ERROR = "失敗".freeze

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
      history.update(last_post_status: SUCCESS, last_post_at: date)
      ActionCable.server.broadcast "manual_post_channel", ids: [history.id], status: SUCCESS
    end

    def set_error
      history = SourceSite::ManualPostHistory.find_by(key: @key)
      history.update(last_post_status: ERROR)
      ActionCable.server.broadcast "manual_post_channel", ids: [history.id], status: ERROR
    end

    def date
      Time.zone.now
    end
end
