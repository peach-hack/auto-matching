class ApplicationJob < ActiveJob::Base
  def time_now
    Time.zone.now
  end
end
