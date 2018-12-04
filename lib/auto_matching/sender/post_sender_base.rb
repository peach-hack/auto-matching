# frozen_string_literal: true

module AutoMatching
  module Sender
    class PostSenderBase < Base
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
          # サイトオープン
          session.visit(url)

          # ログイン
          try_login

          # 掲示板過去の記事の削除
          delete_past_post

          # 記事の投稿
          send_new_post
        end

        def source_site
          @source_site ||= SourceSite.find_by(key: self.class.source_site_key)
        end

        def source_site_key
          raise NotImprementedError
        end

        def try_login
          raise NotImprementedError
        end

        def delete_past_post
          raise NotImprementedError
        end

        def send_new_post
          raise NotImprementedError
        end

        def login_user
          source_site.login_user
        end

        def login_password
          source_site.login_password
        end

        def url
          source_site.url
        end

        def host
          url.split(URI.parse(url).path).first.to_s
        end
    end
  end
end
