module Api
  module Users
    module Posts
      class SlackController < ::ApplicationController
        before_action :authenticate_user unless Rails.env.test?

        def index
        end

        def execute
          site_ids = [2, 3, 4]
          area_list = ["東京都", "神奈川県"]
          genre_list = ["今スグ会いたい"]
          settings = params[:settings]

          settings.each do |setting|
            # slack設定をDBに入れる
          end

          reader_classes = [
            AutoMatching::Reader::Happymail,
            AutoMatching::Reader::Wakuwaku,
            AutoMatching::Reader::Pcmax,
            AutoMatching::Reader::Ikukuru,
            AutoMatching::Reader::Mint,
            AutoMatching::Reader::Merupara,
          ]

          site_ids.each do |id|
            reader_class = reader_classes[id - 1].to_s
            PostSlackJob.perform_later(reader_class, area_list, genre_list)
          end

          response_success(:daily_crawl, :execute)
        end
      end
    end
  end
end
