# frozen_string_literal: true

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
n
      class << self
        def source_site_key
          SourceSite::KEY_HAPPY_MAIL
        end
      end

      private

        def try_login
          set_cookie
          session.visit(url)

          login_mobile
        end

        def delete_past_post
          session.visit("https://happymail.co.jp/sp/app/html/keijiban_write_log.php")
          sleep 0.5
          session.execute_script "$('.ds_link_tab_item').not('ds_link_tab_item_is_active').trigger('click')"
          sleep 0.5
          session.execute_script "$('.icon-header_trush').trigger('click')"
          sleep 0.5
          session.execute_script "$('.ds_js_check_box_input').trigger('click')"
          sleep 0.5
          session.execute_script "$('#button-delete').trigger('click')"
          sleep 0.5
          session.execute_script "$('.modal-confirm').trigger('click', '[data-remodal-action=\"confirm\"]')"
          sleep 3
       end

        def login_mobile
          session.fill_in "TelNo", with: login_user
          session.fill_in "Pass", with: login_password

          session.first("#login_btn").native.send_keys(:return)
        end

        def login_pc
          session.fill_in "TelNo", with: login_user
          session.fill_in "Pass_x", with: login_password
          session.first("#telLoginLink").click
        end
    end
  end
end
