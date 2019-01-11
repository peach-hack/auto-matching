class ManualPostJob < ApplicationJob
  queue_as :default

  SUCCESS = "Success".freeze
  ERROR = "Error".freeze

  def perform(debug_flag, sender_class_s)
    $DEBUG = debug_flag
    klass = sender_class_s.constantize
    @key = klass.new.source_site_key

    AutoMatching::Sender::Executor.new.run(klass)

    set_success
  rescue StandardError => e
    set_error
  ensure
    $DEBUG = false
  end

  private
    def set_success
      set_status(SUCCESS)
    end

    def set_error
      set_status(ERROR)
    end

    def set_status(status)
      history = SourceSite::ManualPostHistory.find_by(key: @key)
      history.update(last_post_status: status, last_post_at: date)
    end

    def date
      Time.zone.now
    end
end
