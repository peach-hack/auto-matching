module AutoMatching
  class SlackUtils
    def notify_posts
      messages.each do |message|
        notify_post(message)
      end
    end

    def notify_post(message = "sample message")
      content = {
        text: message,
        icon_emoji: ":sparkling_heart:"
      }
      notifier.ping(content)
    end

    private
      def messages
        posts.map do |post|
          message_format(
            title: post.title
            )
        end
      end

      def message_format(post = {})
        post[:title]
      end

      def posts
        Post.all.limit(10)
      end

      def notifier
        @notifier ||= Slack::Notifier.new(default_webhook_url)
      end

      def default_webhook_url
        ENV["SLACK_WEBHOOK_URL"]
      end
  end
end
