class ManualJob < ApplicationJob
  private
    def set_success(key, channel)
      history = SourceSite::ManualPostHistory.find_by(key: key)
      history.update(last_post_status: SUCCESS, last_post_at: time_now)
      ActionCable.server.broadcast channel, ids: [history.id], status: SUCCESS
    end

    def set_error(key, channel)
      history = SourceSite::ManualPostHistory.find_by(key: key)
      history.update(last_post_status: ERROR)
      ActionCable.server.broadcast channel, ids: [history.id], status: ERROR
    end
end
