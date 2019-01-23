module Api
  module Users
    class SearchController < ::ApplicationController
      def db
        q = Post.includes(:profile).ransack(search_params)
        posts = q.result(distinct: true).limit(10)
        render json: PostSerializer.new(posts).serialized_json
      end

      def realtime
      end

      def keyword
      end

      private
        def search_params
          params.require(:q).permit(:title_cont, :post_at_gteq, :post_at_lteq, :prefecture_cont, :city_cont, :profile_name_cont)
        end
    end
  end
end
