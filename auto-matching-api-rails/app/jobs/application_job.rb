class ApplicationJob < ActiveJob::Base
  def date
    Time.zone.now
  end
end
