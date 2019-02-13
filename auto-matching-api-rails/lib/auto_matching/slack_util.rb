module AutoMatching
  class SlackUtils
    class << self
      def post(message)
        notifier = Slack::Notifier.new(webhook_url)
        notifier.ping(message)
      end

      private

        def webhook_url
          # TODO
        end
    end
  end
end
