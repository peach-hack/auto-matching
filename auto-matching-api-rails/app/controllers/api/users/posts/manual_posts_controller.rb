module Api
  module Users
    module Posts
      class ManualPostsController < ::ApplicationController
        before_action :authenticate_user

        def index
          histories = SourceSite::ManualPostHistory.all
          render json: ManualPostHistorySerializer.new(histories).serialized_json
        end

        def execute
          site_ids = params[:ids]
          debug_flag = params[:debug]

          histories = SourceSite::ManualPostHistory.find(site_ids)

          sender_classes = [
            AutoMatching::Sender::Happymail,
            AutoMatching::Sender::Wakuwaku,
            AutoMatching::Sender::Pcmax,
            AutoMatching::Sender::Ikukuru,
            AutoMatching::Sender::Mint,
            AutoMatching::Sender::Merupara,
          ]

          site_ids.each do |id|
            site_history = histories.first

            if elapsed_time(site_history.last_post_at) > ENV["NEXT_POST_ALLOW_TIME"].to_f
              sender_class = sender_classes[id - 1].to_s
              ManualPostJob.perform_later(debug_flag, sender_class)
            else
              # どうやって制御しよう。
            end
          end

          response_success(:manual_posts, :execute)
        end

        private

          def elapsed_time(last_time)
            elapsed_seconds = Time.zone.now - last_time
            elapsed_mitutes = elapsed_seconds / 60
          end
      end
    end
  end
end
