module Api
  module Users
    class SearchController < ::ApplicationController
      def db
        q = Post.ransack(params[:q])
        posts = q.result(distinct: true).limit(10)
        render json: PostSerializer.new(posts).serialized_json
      end

      def realtime
      end

      def keyword
      end
    end
  end
end
