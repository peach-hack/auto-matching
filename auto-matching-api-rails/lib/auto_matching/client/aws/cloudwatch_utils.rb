module AutoMatching
  module Client
    module Aws
      class ClowdwatchUtils
        def client
          @client ||= Aws::CloudWatch::Client.new(
            access_key_id: ENV["AWS_ACCESS_KEY_ID"],
            secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
            region: resion
            )
        end

        def resion
          "ap-northeast-1" # 東京
        end
      end
    end
  end
end
