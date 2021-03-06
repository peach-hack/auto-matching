module AutoMatching
  module Checker
    class CheckerBase < Base
      include Common::DriverBase

      def module_type
        "CHECKER"
      end

      private

        def run_process
          # 実行条件のチェック
          if !login_user.present?
            p "ログインIDが設定されていません"
            raise StandardError
          end
          if !login_password.present?
            p "ログインパスワードが設定されていません"
            raise StandardError
          end

          # サイトオープン
          session.visit(url)

          # ログイン
          try_login
        end
    end
  end
end
