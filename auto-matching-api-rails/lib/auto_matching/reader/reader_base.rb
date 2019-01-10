module AutoMatching
  module Reader
    class ReaderBase < Base
      include Common::DriverBase

      def module_type
        "READER".freeze
      end

      private

        def run_process
          # 実行条件のチェック
          return if !login_user.present? || !login_password.present?

          # サイトオープン
          session.visit(url)

          # ログイン
          try_login

          # 掲示板記事のスクレイピング
          read_board
        end

        def read_board
          raise NotImprementedError
        end
    end
  end
end
