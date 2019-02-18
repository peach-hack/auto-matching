module AutoMatching
  module Client
    class CloudwatchUtils
      def list_rules
        client.list_rules
      end

      private
        def client
          @client ||= Aws::CloudWatchEvents::Client.new(
            access_key_id: ENV["AWS_ACCESS_KEY_ID"],
            secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
            region: region
            )
        end

        def region
          "ap-northeast-1" # 東京
        end
    end
  end
end
