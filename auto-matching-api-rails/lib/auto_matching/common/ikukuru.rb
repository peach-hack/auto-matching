module AutoMatching
  module Checker
    class Ikukuru < CheckerBase
      include Common::Ikukuru

      def try_login
        session.fill_in "tel", with: login_user
        session.fill_in "password", with: login_password
        session.execute_script("$('form#form1').submit()")
      end
    end
  end
end
