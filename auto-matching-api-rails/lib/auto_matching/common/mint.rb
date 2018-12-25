module AutoMatching
  module Common
    module Mint
      def source_site_key
        SourceSite::KEY_MINT
      end

      def try_login
        session.fill_in "loginid", with: user_id
        session.fill_in "pwd", with: password
        session.find("#B1login").click
      end
    end
  end
end
