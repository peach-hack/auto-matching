# frozen_string_literal: true

module AutoMatching
  module Sender
    class Pcmax < PostSenderBase
      class << self
        def source_site_key
          SourceSite::KEY_PCMAX
        end
      end

      private

        def try_login
          # session.first(".register-header > .register-h2#login-tab").click
          #
          # session.fill_in "login_id", with: login_user
          # session.fill_in "login_pw", with: login_password
          # session.click_on "会員ログイン"
        end

        def delete_past_post
        end

        def send_new_post
        end
    end
  end
end
