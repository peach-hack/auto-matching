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
          session.fill_in "tel", with: login_user
          session.fill_in "password", with: login_password
          session.click_button "ログイン"
        end

        def delete_past_post
          session.visit("https://sp.194964.com/bbs/show_bbs_write_list.html")

          unless session.find(".mb10").text == " 書込みをしてアピールしよ"
            session.click_button "すべて削除する"
            session.click_button "削除する"
          end
        end

        def send_new_post
          # session.visit("http://550909.com/m/bbs/post/?menu=adult&genre=3")
          #
          # session.fill_in "title", with: post[:title]
          # session.fill_in "body", with: post[:body]
          #
          # unless ENV["DEBUG"]
          #   session.execute_script "$('.js-btn--post').trigger('click')"
          # end
        end
    end
  end
end
