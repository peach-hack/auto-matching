module AutoMatching
  module Checker
    class CheckerBase < Base
      include Common::DriverBase

      private

        def run_process
          logger.info("CHECKER: #{source_site_key} start")

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

          logger.info("CHECKER: #{source_site_key} end")
        end
    end
  end
end
