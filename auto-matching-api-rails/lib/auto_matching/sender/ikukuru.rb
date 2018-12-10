# frozen_string_literal: true

module AutoMatching
  module Sender
    class Ikukuru < PostSenderBase
      class << self
        def source_site_key
          SourceSite::KEY_IKUKURU
        end
      end

      private

        def try_login
          login
        end

        def login
          session.fill_in "tel", with: login_user
          session.fill_in "password", with: login_password
          session.execute_script("$('form#form1').submit()")
        end

        def delete_past_post
          session.visit("https://sp.194964.com/bbs/show_bbs_write_list.html")

          unless session.find(".mb10").text == " 書込みをしてアピールしよ"
            session.click_button "すべて削除する"
            session.click_button "削除する"
          end
        end

        def send_new_post
          # session.visit("https://sp.194964.com/menu.html")
          session.visit("https://sp.194964.com/bbs/show_write.html?q=RFIvRUgrRFVpSmV6N2NPSitVSWM5MVlhZ1FqT1JtNDBFQ2ZCTGx5VUpSZjNKTWNoUm5Tdk4ydlJ1ekhidnVGRQ%3D%3D")

          session.fill_in "title", with: post[:title]
          session.fill_in "body", with: post[:body]

          unless ENV["DEBUG"]
            session.find(".greenButton.width60").native.send_keys :enter
          end
        end
    end
  end
end
