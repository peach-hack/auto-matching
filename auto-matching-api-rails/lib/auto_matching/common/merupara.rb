module AutoMatching
  module Common
    module Merupara
      def source_site_key
        SourceSite::KEY_MERUPARA
      end

      def try_login
        session.fill_in "loginid", with: user_id
        session.fill_in "pwd", with: password
        session.find("#B1login").click
      end
    end
  end
end
