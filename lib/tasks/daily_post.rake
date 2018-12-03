# frozen_string_literal: true

module DailyPost
  extend Rake::DSL
  extend self

  namespace :daily_post do
    desc "一括投稿(All)"
    task all: :environment do
      sender_classes = [
          AutoMatching::Sender::HappyMail
      ]
      sender_classes.each { | sender_class| AutoMatching::Sender::Executor.new.run(sender_class) }
    end

    desc "個別投稿(ハッピーメール)"
    task all: :environment do
      AutoMatching::Sender::Executor.new.run(AutoMatching::Sender::HappyMail)
    end
  end
end
