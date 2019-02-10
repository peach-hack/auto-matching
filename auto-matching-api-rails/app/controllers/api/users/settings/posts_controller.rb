module Api
  module Users
    module Settings
      class PostsController < ::ApplicationController
        before_action :authenticate_user unless Rails.env.test?

        def index
          post_count = Post.count
          profile_count = Profile.count

          posts = Post.order(:post_at)
          last = post_count != 0 && posts.first.post_at
          latest = post_count != 0 && posts.last.post_at
          response = { post_count: post_count, profile_count: profile_count, last: last, latest: latest }
          render json: response
        end

        def clear
          Post.delete_all
          Profile.delete_all
          response_success(:posts, :clear)
        end
      end
    end
  end
end
