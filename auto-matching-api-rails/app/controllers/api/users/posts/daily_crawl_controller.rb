module Api
  module Users
    module Posts
      class DailyCrawlController < ::ApplicationController
        before_action :authenticate_user unless Rails.env.test?
        def execute
          site_ids = params[:ids]
          area_list = params[:area]
          genre_list = params[:genre]

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
            DailyCrawlJob.perform_later(reader_class, area_list, genre_list)
          end

          response_success(:daily_crawl, :execute)
        end
      end
    end
  end
end
