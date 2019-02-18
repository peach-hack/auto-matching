module Api
  module Users
    module Auto
      class ScheduleController < ::ApplicationController
        before_action :authenticate_user unless Rails.env.test?

        def index
          schedule = Schedule.first
          render json: ScheduleSerializer.new(schedule).serialized_json
        end

        def update
        end
      end
    end
  end
end
