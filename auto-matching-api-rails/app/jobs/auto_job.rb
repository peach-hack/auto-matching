class AutoJob < ApplicationJob
  private
    def set_success(key)
      history = SourceSite::ManualPostHistory.find_by(key: key)
      history.update(last_post_status: SUCCESS, last_post_at: time_now)
    end

    def set_error(key)
      history = SourceSite::ManualPostHistory.find_by(key: key)
      history.update(last_post_status: ERROR)
    end
end
