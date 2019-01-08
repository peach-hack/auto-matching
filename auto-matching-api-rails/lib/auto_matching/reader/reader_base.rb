module AutoMatching
  module Reader
    class ReaderBase < Base
      include Common::DriverBase

      private

        def run_process
          logger.info("READER: #{source_site_key} start")

          # 実行条件のチェック
          return if !login_user.present? || !login_password.present?

          # サイトオープン
          session.visit(url)

          # ログイン
          try_login

          # 掲示板記事のスクレイピング
          read_board

          logger.info("READER: #{source_site_key} end")
        end

        def read_board
          raise NotImprementedError
        end
    end
  end
end
