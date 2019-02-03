module Api
  module Users
    module Settings
      class PostsController < ::ApplicationController
        before_action :authenticate_user unless Rails.env.test?

        def index
          count = Post.count
          posts = Post.order(:post_at)
          last = count != 0 && posts.first.post_at
          latest = count != 0 && posts.last.post_at
          response = { count: count, last: last, latest: latest }
          render json: response
        end

        def clear
          Post.delete_all
          response_success(:posts, :clear)
        end
      end
    end
  end
end
