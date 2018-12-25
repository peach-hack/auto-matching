module AutoMatching
  module Common
    module Wakuwaku
      def source_site_key
        SourceSite::KEY_WAKUWAKU
      end

      def try_login
        session.fill_in "email", with: user_id
        session.fill_in "password", with: password
        session.click_on "ログイン"
      end
    end
  end
end
