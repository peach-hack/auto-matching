module Api
  module Users
    class SearchController < ::ApplicationController
      def db
        q = Post.ransack(search_params)
        posts = q.result(distinct: true).limit(10)
        render json: PostSerializer.new(posts).serialized_json
      end

      def realtime
      end

      def keyword
      end

      private
        def search_params
          params.require(:q).permit(:title_cont, :post_at_gteq, :post_at_lteq,
            :prefecture_cont, :city_cont, :profile_name_cont, :profile_age_eq,
            :profile_source_site_name_eq, :category_eq)
        end
    end
  end
end
