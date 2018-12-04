# frozen_string_literal: true

module AutoMatching
  module Sender
    class Wakuwaku < PostSenderBase

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
          session.execute_script "document.post.all.value=1;document.post.submit();return false;"
          session.execute_script "document.post.submit();return false;"
        end

        def send_new_post
        end

    end
  end
end
