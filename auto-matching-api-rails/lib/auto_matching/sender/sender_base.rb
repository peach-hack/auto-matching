module AutoMatching
  module Sender
    class SenderBase < Base
      include Common::DriverBase

      attr_reader :post

      def initialize(post: nil)
        @post = post if post.present?
        super
      end

      def run
        run_process
      rescue StandardError => e
        raise e
      end

      private

        def run_process
          # 実行条件のチェック
          return if !login_user.present? || !login_password.present?

          # サイトオープン
          session.visit(url)

          # ログイン
          try_login

          # 掲示板過去の記事の削除
          delete_past_post

          # 記事の投稿
          send_new_post
        end

        def delete_past_post
          raise NotImprementedError
        end

        def send_new_post
          raise NotImprementedError
        end
    end
  end
end
