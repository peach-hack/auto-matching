module BoardWatch
  extend Rake::DSL
  extend self

  namespace :board_watch do
    desc "掲示板監視(All)"
    task all: :environment do
      classes = [
          AutoMatching::Reader::HappyMail,
          AutoMatching::Reader::Wakuwaku,
          AutoMatching::Reader::Pcmax,
          AutoMatching::Reader::Ikukuru,
          AutoMatching::Reader::Mint,
          AutoMatching::Reader::Merupara,
      ]
      classes.each { | klass| AutoMatching::Reader::Executor.new.run(klass) }
    end

    desc "個別監視(ハッピーメール)"
    task happymail: :environment do
      AutoMatching::Reader::Executor.new.run(AutoMatching::Reader::HappyMail)
    end

    desc "個別監視(ワクワクメール)"
    task wakuwaku: :environment do
      AutoMatching::Reader::Executor.new.run(AutoMatching::Reader::Wakuwaku)
    end

    desc "個別監視(PCMAX)"
    task pcmax: :environment do
      AutoMatching::Reader::Executor.new.run(AutoMatching::Reader::Pcmax)
    end

    desc "個別監視(イクヨクルヨ)"
    task ikukuru: :environment do
      AutoMatching::Reader::Executor.new.run(AutoMatching::Reader::Ikukuru)
    end

    desc "個別監視(ミントC!Jメール)"
    task mint: :environment do
      AutoMatching::Reader::Executor.new.run(AutoMatching::Reader::Mint)
    end

    desc "個別監視(メルパラ)"
    task merupara: :environment do
      AutoMatching::Reader::Executor.new.run(AutoMatching::Reader::Merupara)
    end
  end
end
