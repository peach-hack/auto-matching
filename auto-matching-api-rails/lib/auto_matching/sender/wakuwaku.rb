# frozen_string_literal: true

module AutoMatching
  module Sender
    class Wakuwaku < SenderBase
      class << self
        def source_site_key
          SourceSite::KEY_WAKUWAKU
        end
      end

      private

        def try_login
          session.fill_in "email", with: login_user
          session.fill_in "password", with: login_password
          session.click_on "ログイン"
        end

        def delete_past_post
          session.visit("http://550909.com/m/bbs/history")

          # すでに投稿がある場合は投稿を削除
          unless session.has_css?(".BtnToPureBBS")
            session.execute_script "document.post.all.value=1;document.post.submit();return false;"
            session.execute_script "document.post.submit();return false;"
          end
        end

        def send_new_post
          session.visit("http://550909.com/m/bbs/post/?menu=adult&genre=3")

          session.fill_in "title", with: post[:title]
          session.fill_in "body", with: post[:body]

          unless ENV["DEBUG"]
            session.execute_script "$('.js-btn--post').trigger('click')"
          end
        end
    end
  end
end
