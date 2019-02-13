class ApplicationJob < ActiveJob::Base
  SUCCESS = "成功".freeze
  ERROR = "失敗".freeze

  private
    def time_now
      Time.zone.now
    end
end
