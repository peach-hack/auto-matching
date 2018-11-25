module DeaiFetcher
  module Sender
    class HappyMail < PostSenderBase
      def run_process
        # ログイン
        try_login

        # 掲示板過去の記事の削除
        delete_past_post

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
        set_cookie
        session.visit(url)

        login_pc
      end

      def delete_past_post
        session.visit("https://happymail.co.jp/sp/app/html/keijiban_write_log.php")
        session.first(".ds_link_tab_text_bg_otherbbs").click
        session.first(".icon-header_trush").click

        session.find("billboard_id[]").each(&:click)

        session.first(".ds_check_box_submit_delete").click
        sleep 15
      end

      # モバイルだとログインできない。ガードされてる？
      def login_mobile
        session.fill_in "TelNo", with: login_user
        session.fill_in "Pass", with: login_password
        session.find_link("login_btn").click
      end

      def login_pc
        session.fill_in "TelNo", with: login_user
        session.fill_in "Pass_x", with: login_password
        session.first("#telLoginLink").click
      end
    end
  end
end
