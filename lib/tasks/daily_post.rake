# frozen_string_literal: true

module DailyPost
  extend Rake::DSL
  extend self

  namespace :daily_post do
    desc "個別投稿(ハッピーメール)"
    task happymail: :environment do
      send_post(AutoMatching::Sender::HappyMail)
    end

    def send_post(sender_class)
      start_time = Time.now

      post = sample_first_post
      sender_class.new(post: post).run
      end_time = Time.now

      pp "end.(#{end_time - start_time}s)"
    end

    private

      def sample_first_post
        Post.offset(rand(Post.count)).first
      end
  end
end
