module AutoMatching
  module Common
    module Pcmax
      def source_site_key
        SourceSite::KEY_PCMAX
      end

      def try_login
        session.execute_script "$('.register-header > .register-h2#login-tab').trigger('click')"

        session.fill_in "login_id", with: login_user
        session.fill_in "login_pw", with: login_password

        session.execute_script "$('button.login-btn').click()"
      end
    end
  end
end
