module AutoMatching
  module Common
    module Happymail
      def source_site_key
        SourceSite::KEY_HAPPY_MAIL
      end

      def try_login
        login_mobile
      end

      def login_mobile
        session.fill_in "TelNo", with: user_id
        session.fill_in "Pass", with: password

        session.first("#login_btn").native.send_keys(:return)
      end

      def login_pc
        session.fill_in "TelNo", with: user_id
        session.fill_in "Pass_x", with: password
        session.first("#telLoginLink").click
      end
    end
  end
end
