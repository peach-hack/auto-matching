module Api
  module Users
    module Search
      class PostsController < ::ApplicationController
        def index
          q = Post.ransack(params[:q])
          posts = q.result(distinct: true).recent
          render json: PostSerializer.new(posts).serialized_json
        end
      end
    end
  end
end
