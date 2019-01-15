module Api
  module Users
    module Search
      class PostsController < ::ApplicationController
        def index
          q = Post.ransack(params[:q])
          posts = q.result(distinct: true).limit(10)
          render json: PostSerializer.new(posts).serialized_json
        end
      end
    end
  end
end
