module AutoMatching
  module Sender
    class Ikukuru < SenderBase
      include Common::Ikukuru

      private
        def delete_past_post
          logging_start(__method__)

          session.visit("https://sp.194964.com/bbs/show_bbs_write_list.html")

          if not session.has_css?(".mb10")
            session.click_button "すべて削除する"
            session.click_button "削除する"
          end

          logging_end(__method__)
        end

        def send_new_post
          logging_start(__method__)

          session.visit("https://sp.194964.com/bbs/show_write.html?q=RFIvRUgrRFVpSmV6N2NPSitVSWM5MVlhZ1FqT1JtNDBFQ2ZCTGx5VUpSZjNKTWNoUm5Tdk4ydlJ1ekhidnVGRQ%3D%3D")

          session.fill_in "title", with: post[:title]
          session.fill_in "body", with: post[:body]

          submit { session.find(".greenButton.width60").native.send_keys :enter }

          logging_end(__method__)
        end
    end
  end
end
