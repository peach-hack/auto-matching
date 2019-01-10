module AutoMatching
  module Common
    module Wakuwaku
      def source_site_key
        SourceSite::KEY_WAKUWAKU
      end

      def try_login
        logging_start(__method__)

        session.fill_in "email", with: login_user
        session.fill_in "password", with: login_password
        session.click_on "会員ログイン"

        logging_end(__method__)
      end
    end
  end
end
