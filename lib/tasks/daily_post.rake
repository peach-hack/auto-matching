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

      # post = Post.sample.first
      post = { title: "test", body: "テストです。" }
      sender_class.new(post: post).run
      end_time = Time.now

      pp "end.(#{end_time - start_time}s)"
    end
  end
end
