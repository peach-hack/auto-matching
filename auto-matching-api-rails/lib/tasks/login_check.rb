module LoginCheck
  extend Rake::DSL
  extend self

  namespace :login_check do
    desc "ログイン確認(All)"
    task all: :environment do
      classes = [
          AutoMatching::Checker::HappyMail,
          AutoMatching::Checker::Wakuwaku,
          AutoMatching::Checker::Pcmax,
          AutoMatching::Checker::Ikukuru,
          AutoMatching::CHecker::Mint,
          AutoMatching::Chekcer::Merupara,
      ]
      classes.each { | klass| AutoMatching::Checker::Executor.new.run(klass) }
    end

    desc "ログイン確認(ハッピーメール)"
    task happymail: :environment do
      AutoMatching::Checker::Executor.new.run(AutoMatching::Checker::HappyMail)
    end

    desc "ログイ確認(ワクワクメール)"
    task wakuwaku: :environment do
      AutoMatching::Checker::Executor.new.run(AutoMatching::Checker::Wakuwaku)
    end

    desc "ログイン確認(PCMAX)"
    task pcmax: :environment do
      AutoMatching::Checker::Executor.new.run(AutoMatching::Checker::Pcmax)
    end

    desc "ログイン確認(イクヨクルヨ)"
    task ikukuru: :environment do
      AutoMatching::Checker::Executor.new.run(AutoMatching::Checker::Ikukuru)
    end

    desc "ログイン確認(ミントC!Jメール)"
    task mint: :environment do
      AutoMatching::Checker::Executor.new.run(AutoMatching::Checker::Mint)
    end

    desc "ログイン確認(メルパラ)"
    task merupara: :environment do
      AutoMatching::Checker::Executor.new.run(AutoMatching::Checker::Merupara)
    end
  end
end
