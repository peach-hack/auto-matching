module AutoMatching
  module Reader
    class ReaderBase < Base
      include Common::DriverBase

      def run
        run_process
      rescue StandardError => e
        raise e
      end

      private

        def run_process
          # 実行条件のチェック
          return if !user_id.present? || !password.present?

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
