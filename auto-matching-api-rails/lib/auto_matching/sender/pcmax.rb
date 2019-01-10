module AutoMatching
  module Sender
    class Pcmax < SenderBase
      include Common::Pcmax

      private
        def delete_past_post
          logging_start(__method__)

          sleep 1
          session.visit("https://pcmax.jp/mobile/bbs_write.php")
          session.click_link "過去の投稿を確認"

          if not session.has_css?(".write_text")
            select_latest_post
            session.click_link "削除する"
          end

          logging_end(__method__)
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
          logging_start(__method__)

          session.visit("https://pcmax.jp/mobile/bbs_write.php")

          session.click_link "スグ会いたい"

          session.fill_in "bbs_title", with: post[:title]
          session.fill_in "bbs_comment", with: post[:body]

          submit { session.find("#wri").native.send_keys :enter }

          logging_end(__method__)
        end
    end
  end
end
