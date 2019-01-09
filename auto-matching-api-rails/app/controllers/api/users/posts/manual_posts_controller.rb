module Api
  module Users
    module Posts
      class ManualPostsController < ::ApplicationController
        def execute
          response_success(:manual_posts, :execute)
        end
      end
    end
  end
end
