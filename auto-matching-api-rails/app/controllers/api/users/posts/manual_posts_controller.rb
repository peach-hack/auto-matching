module Api
  module Users
    module Posts
      class ManualPostsController < ::ApplicationController
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

            # 3時間以内の再投稿は試行せずに投稿禁止の旨を表示する
            if (Time.zone.now - site_history.last_post_at) / 60 < 180 then
              # TODO: フロント側「投稿ステータス」の部分にその旨を示すためにはどうすればよい？
              logger.debug("連投検知")
            else
              sender_class = sender_classes[id - 1].to_s
              ManualPostJob.perform_later(debug_flag, sender_class)
            end
          end

          response_success(:manual_posts, :execute)
        end
      end
    end
  end
end
