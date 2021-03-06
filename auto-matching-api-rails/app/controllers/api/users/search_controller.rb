module Api
  module Users
    class SearchController < ::ApplicationController
      before_action :authenticate_user unless Rails.env.test?

      def db
        q = Post.ransack(search_params)
        posts = q.result(distinct: true).limit(1000).ordering { post_at.desc }
        render json: PostSerializer.new(posts).serialized_json
      end

      def index
        histories = SourceSite::SearchHistory.all
        render json: SearchHistorySerializer.new(histories).serialized_json
      end

      def keyword
      end

      def realtime
        site_ids = params[:ids]
        area_list = params[:area].split(" ")
        genre_list = params[:genre]

        reader_classes = [
          AutoMatching::Reader::Happymail,
          AutoMatching::Reader::Wakuwaku,
          AutoMatching::Reader::Pcmax,
          AutoMatching::Reader::Ikukuru,
          AutoMatching::Reader::Mint,
          AutoMatching::Reader::Merupara,
        ]

        start_time = Time.zone.now.to_s

        site_ids.each do |id|
          reader_class = reader_classes[id - 1].to_s
          RealtimeSearchJob.perform_later(reader_class, start_time, area_list, genre_list)
        end

        response_success(:search, :execute)
      rescue StandardError
        response_internal_server_error(:search, :execute)
      end

      def result
        posts = Post.where.has { |post| post.post_at >= params[:time].to_datetime.ago(2.hours) }.ordering { post_at.desc }
        render json: PostSerializer.new(posts).serialized_json
      end

      private
        def search_params
          params.require(:params).require(:q).permit(:title_cont, :post_at_gteq, :post_at_lteq,
            :prefecture_cont, :city_cont, :profile_name_cont, :profile_age_eq,
            :profile_source_site_name_eq, :category_eq)
        end
    end
  end
end
