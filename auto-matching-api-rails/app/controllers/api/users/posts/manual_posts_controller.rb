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

          manual_post_histories = SourceSite::ManualPostHistory.find(site_ids)

          sender_classes = [
            AutoMatching::Sender::Happymail,
            AutoMatching::Sender::Wakuwaku,
            AutoMatching::Sender::Pcmax,
            AutoMatching::Sender::Ikukuru,
            AutoMatching::Sender::Mint,
            AutoMatching::Sender::Merupara,
          ]

          site_ids.each do |id|
            @last_time = manual_post_histories.shift.last_post_at

            # MEMO: 連投制限に引っかかった場合は、Jobの呼び出しをスキップする。
            #       bad_requestを返さないので投稿ステータスが「実行中」から変わらないが、第一リリース時点では運用回避に留める。
            # TODO: エラー返却の制御→第二リリース?
            next if !allow_manual_post?

            sender_class = sender_classes[id - 1].to_s
            ManualPostJob.perform_later(debug_flag, sender_class)
          end

          response_success(:manual_posts, :execute)
        end

        private

          def allow_manual_post?
            # TODO: 投稿制限条件を強める考慮
            calculate_elapsed_minutes > ENV["NEXT_MANUAL_POST_ALLOW_MINUTES"].to_f
          end

          def calculate_elapsed_minutes
            elapsed_seconds = Time.zone.now - @last_time
            elapsed_seconds / 60
          end
      end
    end
  end
end
