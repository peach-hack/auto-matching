module AutoMatching
  module Common
    module Wakuwaku
      def source_site_key
        SourceSite::KEY_WAKUWAKU
      end

      def try_login
        session.fill_in "email", with: login_user
        session.fill_in "password", with: login_password
        session.click_on "会員ログイン"
      end
    end
  end
end
