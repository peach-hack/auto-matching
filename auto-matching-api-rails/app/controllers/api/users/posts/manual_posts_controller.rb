module Api
  module Users
    module Posts
      class ManualPostsController < ::ApplicationController
        before_action :authenticate_user unless Rails.env.test?
        def index
          histories = SourceSite::ManualPostHistory.all
          render json: ManualPostHistorySerializer.new(histories).serialized_json
        end

        def execute
          site_ids = params[:ids]
          debug_flag = params[:debug]

          sender_classes = [
            AutoMatching::Sender::Happymail,
            AutoMatching::Sender::Wakuwaku,
            AutoMatching::Sender::Pcmax,
            AutoMatching::Sender::Ikukuru,
            AutoMatching::Sender::Mint,
            AutoMatching::Sender::Merupara,
          ]

          site_ids.each do |id|
            sender_class = sender_classes[id - 1].to_s
            ManualPostJob.perform_later(debug_flag, sender_class)
          end

          response_success(:manual_posts, :execute)
        end
      end
    end
  end
end
