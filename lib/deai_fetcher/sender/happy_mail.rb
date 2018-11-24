module DeaiFetcher
  module Sender
    class HappyMail < PostSenderBase
      def run_process
        # ログイン
        try_login

        # 掲示板過去の記事の削除
        # delete_past_post

        # 記事の投稿
        # send_new_post
      end

      class << self
        def source_site_key
          SourceSite::KEY_HAPPY_MAIL
        end
      end

      private

      def logged_in?
        # 謎
        # session.first(".funcBtn_login").blank?
      end

      def try_login
        return if logged_in?

        # session.fill_in "userid", with: login_user
        # session.fill_in "password", with: login_password
        # session.first(".funcBtn_login").click
      end
    end
  end
end
