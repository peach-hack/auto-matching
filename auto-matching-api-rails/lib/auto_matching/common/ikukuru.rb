module AutoMatching
  module Common
    module Ikukuru
      def source_site_key
        SourceSite::KEY_IKUKURU
      end

      def try_login
        session.fill_in "tel", with: login_user
        session.fill_in "password", with: login_password
        session.execute_script("$('form#form1').submit()")
      end
    end
  end
end
