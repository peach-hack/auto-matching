module AutoMatching
  module Sender
    class SenderBase < Base
      include Common::DriverBase

      attr_reader :post

      def initialize(post: nil)
        @post = post if post.present?
        super
      end

      def module_type
        "SENDER".freeze
      end

      private

        def run_process
          logging_start

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

          logging_end
        end

        def delete_past_post
          raise NotImprementedError
        end

        def send_new_post
          raise NotImprementedError
        end

        def submit
          return if ENV["DEBUG"]
          return if $DEBUG
          yield
        end
    end
  end
end
