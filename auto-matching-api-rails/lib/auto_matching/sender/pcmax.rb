module AutoMatching
  module Sender
    class Pcmax < SenderBase
      class << self
        def source_site_key
          SourceSite::KEY_PCMAX
        end
      end

      private

        def try_login
          session.first(".register-header > .register-h2#login-tab").click

          session.fill_in "login_id", with: login_user
          session.fill_in "login_pw", with: login_password
          session.click_button "会員ログイン"
        end

        def delete_past_post
          session.visit("https://pcmax.jp/mobile/bbs_write.php")
          session.click_link "過去の投稿を確認"

          unless session.find(".write_text").text == "まだ掲示板への投稿はありません。"
            select_latest_post
            session.click_link "削除する"
          end
        end

        def select_latest_post
          session.evaluate_script("
          document.getElementByXPath = function(sValue) {
             var a = this.evaluate(sValue, this, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
          if (a.snapshotLength > 0) { return a.snapshotItem(0); } }")
          target_script = session.evaluate_script("document.getElementByXPath('/html/body/table/tbody/tr[2]/td[3]/a').href")
          session.evaluate_script(target_script.split(":")[1])
        end

        def send_new_post
          session.visit("https://pcmax.jp/mobile/bbs_write.php")

          session.click_link "スグ会いたい"

          session.fill_in "bbs_title", with: post[:title]
          session.fill_in "bbs_comment", with: post[:body]

          unless ENV["DEBUG"]
            session.find("#wri").native.send_keys :enter
          end
        end
    end
  end
end
