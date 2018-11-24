module DailyPost
  extend Rake::DSL
  extend self

  namespace :daily_post do

    # desc "日次投稿"
    # task run: :environment do
    #   start_time = Time.now
    #
    #   DeaiFetcher::Sender::Executor.run
    #
    #   end_time = Time.now
    #
    #   pp "done.(#{end_time - start_time}s)"
    # end

    desc "個別投稿(ハッピーメール)"
    task happymail: :environment do
      send_post(DeaiFetcher::Sender::HappyMail)
    end

    def send_post(sender_class)
      start_time = Time.now

      post = Post.sample.first
      source_site = SourceSite.find_by(key: sender_class.source_site_key)
      post_history = PostHistory::ForDailyPost.create(
          post: post,
          source_site: source_site,
          status: :posting
      )

      begin
        sender_class.new(
            post: post,
            post_history: post_history
        ).run
        post_history.update_post_history_with_successful!
      rescue StandardError => e
        post_history.update_post_history_with_failed!(e)
      end
      end_time = Time.now
      pp "done.(#{end_time - start_time}s)"
    end
  end
end
