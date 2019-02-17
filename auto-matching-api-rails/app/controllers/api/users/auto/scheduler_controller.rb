module Api
  module Users
    module Auto
      class SchedulerController < ::ApplicationController
        before_action :authenticate_user unless Rails.env.test?

        def index
          scheduler = Scheduler.first
          render json: SchedulerSerializer.new(scheduler).serialized_json
        end

        def update
        end
      end
    end
  end
end
