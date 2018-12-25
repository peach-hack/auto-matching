module AutoMatching
  module Common
    module Pcmax
      def source_site_key
        SourceSite::KEY_PCMAX
      end

      def try_login
        session.first(".register-header > .register-h2#login-tab").click

        session.fill_in "login_id", with: login_user
        session.fill_in "login_pw", with: login_password
        session.click_button "会員ログイン"
      end
    end
  end
end
