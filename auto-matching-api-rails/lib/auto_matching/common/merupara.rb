module AutoMatching
  module Checker
    class Merupara < CheckerBase
      include Common::Merupara

      def try_login
        session.fill_in "loginid", with: login_user
        session.fill_in "pwd", with: login_password
        session.find("#B1login").click
      end
    end
  end
end
