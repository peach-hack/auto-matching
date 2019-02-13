module AutoMatching
  class SlackUtils
    def initialize(start_time = Time.zone.now)
      @start_time = start_time
    end

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
          profile = post.profile
          site = profile.source_site
          message_format(
            title: post.title,
            site: site.key
            )
        end
      end

      def message_format(post = {})
        "#{post[:site]}: #{post[:title]}"
      end

      def posts
        Post.where.has { |post| post.updated_at >= @start_time }
      end

      def notifier
        @notifier ||= Slack::Notifier.new(default_webhook_url)
      end

      def default_webhook_url
        ENV["SLACK_WEBHOOK_URL"]
      end
  end
end
