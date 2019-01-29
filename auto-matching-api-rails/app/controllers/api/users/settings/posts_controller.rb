module Api
  module Users
    module Settings
      class PostsController < ::ApplicationController
        before_action :authenticate_user unless Rails.env.test?

        def index
        end

        def clear
          Post.delete_all
          response_success(:posts, :clear)
        end
      end
    end
  end
end
