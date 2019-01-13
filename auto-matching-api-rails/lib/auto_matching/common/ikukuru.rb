module AutoMatching
  module Common
    module Ikukuru
      def source_site_key
        SourceSite::KEY_IKUKURU
      end

      def try_login
        logging_start(__method__)
        session.fill_in "tel", with: login_user
        session.fill_in "password", with: login_password
        session.execute_script("$('form#form1').submit()")
        logging_end(__method__)
      end
    end
  end
end
