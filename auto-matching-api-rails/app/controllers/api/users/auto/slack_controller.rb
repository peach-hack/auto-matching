module Api
  module Users
    module Auto
      class SlackController < ::ApplicationController
        before_action :authenticate_user unless Rails.env.test?

        def index
          workspace = SlackWorkspace.all
          render json: SlackWorkspaceSerializer.new(workspace).serialized_json
        end

        def update
          workspace = SlackWorkspace.find_or_initi_by(webhook_url: params[:webhook_url])
          workspace.update_attributes(webhook_url: params[:webhook_url])
          response_success(:slack, :update)
        rescue
          response_internal_server_error
        end

        def execute
          site_ids = [2, 3, 4]
          area_list = ["東京都", "神奈川県"]
          genre_list = ["今スグ会いたい"]
          # settings = params[:settings]

          # settings.each do |setting|
          # slack設定をDBに入れる
          # end

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
