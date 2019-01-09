module Api
  module Users
    module Posts
      class ManualPostsController < ::ApplicationController
        def execute
          site_ids = params[:ids]
          debug_flag = params[:debug]

          ManualPostJob.perform_later(site_ids, debug_flag)

          response_success(:manual_posts, :execute)
        end
      end
    end
  end
end
