# frozen_string_literal: true

module DailyPost
  extend Rake::DSL
  extend self

  namespace :daily_post do
    desc "一括投稿(All)"
    task all: :environment do
      sender_classes = [
          AutoMatching::Sender::HappyMail,
          AutoMatching::Sender::Wakuwaku,
          AutoMatching::Sender::Pcmax,
          AutoMatching::Sender::Ikukuru,
          AutoMatching::Sender::Mint,
      ]
      sender_classes.each { | sender_class| AutoMatching::Sender::Executor.new.run(sender_class) }
    end

    desc "個別投稿(ハッピーメール)"
    task happymail: :environment do
      AutoMatching::Sender::Executor.new.run(AutoMatching::Sender::HappyMail)
    end

    desc "個別投稿(ワクワクメール)"
    task wakuwaku: :environment do
      AutoMatching::Sender::Executor.new.run(AutoMatching::Sender::Wakuwaku)
    end

    desc "個別投稿(PCMAX)"
    task pcmax: :environment do
      AutoMatching::Sender::Executor.new.run(AutoMatching::Sender::Pcmax)
    end

    desc "個別投稿(イクヨクルヨ)"
    task ikukuru: :environment do
      AutoMatching::Sender::Executor.new.run(AutoMatching::Sender::Ikukuru)
    end

    desc "個別投稿(ミントC!Jメール)"
    task mint: :environment do
      AutoMatching::Sender::Executor.new.run(AutoMatching::Sender::Mint)
    end
  end
end
