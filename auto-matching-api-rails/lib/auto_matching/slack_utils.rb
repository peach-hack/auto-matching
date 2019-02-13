module AutoMatching
  class SlackUtils
    class << self
      def post(message)
        notifier = Slack::Notifier.new(default_webhook_url)
        notifier.ping(message)
      end

      private

        def default_webhook_url
          ENV["SLACK_WEBHOOK_URL"]
        end
    end
  end
end
