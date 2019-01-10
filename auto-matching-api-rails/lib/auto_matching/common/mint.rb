module AutoMatching
  module Common
    module Mint
      def source_site_key
        SourceSite::KEY_MINT
      end

      def try_login
        logging_start(__method__)
        session.fill_in "loginid", with: login_user
        session.fill_in "pwd", with: login_password
        session.find("#B1login").native.send_keys :enter
        logging_end(__method__)
      end
    end
  end
end
