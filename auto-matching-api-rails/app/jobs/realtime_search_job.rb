class RealtimeSearchJob < ManualJob
  queue_as :default
  SEARCH_CHANNEL = "search_channel".freeze

  def perform(reader_class_s, start_time_s, area_list, genre_list)
    klass = reader_class_s.constantize
    @key = klass.new.source_site_key
    @time = start_time_s.to_datetime

    AutoMatching::Reader::Executor.new.run(klass, area_list, genre_list)

    set_success
  rescue StandardError => e
    set_error
    raise e
  end

  private
    def set_success
      history = SourceSite::SearchHistory.find_by(key: @key)
      history.update(last_search_status: SUCCESS, last_search_at: time_now)
      ActionCable.server.broadcast SEARCH_CHANNEL, ids: [history.id], status: SUCCESS, time: @time
    end

    def set_error
      history = SourceSite::SearchHistory.find_by(key: @key)
      history.update(last_search_status: ERROR)
      ActionCable.server.broadcast SEARCH_CHANNEL, ids: [history.id], status: ERROR
    end
end
