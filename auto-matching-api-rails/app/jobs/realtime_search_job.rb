class RealtimeSearchJob < ManualJob
  queue_as :default
  SEARCH_CHANNEL = "search_channel".freeze

  def perform(reader_class_s)
    klass = reader_class_s.constantize
    @key = klass.new.source_site_key

    AutoMatching::Reader::Executor.new.run(klass)

    set_success
  rescue StandardError
    set_error
  end

  private
    def set_success
      history = SourceSite::SearchHistory.find_by(key: @key)
      history.update(last_search_status: SUCCESS, last_search_at: date)
      ActionCable.server.broadcast SEARCH_CHANNEL, ids: [history.id], status: SUCCESS
    end

    def set_error
      history = SourceSite::SearchHistory.find_by(key: @key)
      history.update(last_search_status: ERROR)
      ActionCable.server.broadcast SEARCH_CHANNEL, ids: [history.id], status: ERROR
    end
end
