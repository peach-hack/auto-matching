module AutoMatching
  module Reader
    class ReaderBase < Base
      include Common::DriverBase
      attr_reader :post_data_list

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

          # 掲示板検索
          search_board

          # 掲示板記事のスクレイピング
          scraping_board
        end

        def search_board
          raise NotImprementedError
        end

        def scraping_board
          # 掲示板データ読み取り
          read_board

          # 掲示板データ保存
          save_board

          scraping_board if continue?
        end

        def read_board
          raise NotImprementedError
        end

        def save_board
          raise NotImprementedError
        end

        def continue?
          last_search_at = SourceSite::SearchHistory.find_by(key: source_site_key).last_search_at&.to_datetime
          last_post_at = post_data_list.last[:post_at].to_datetime

          if last_search_at && last_post_at >= last_search_at
            click_next
            true
          else
            false
          end
        end

        def click_next
          raise NotImplementedError
        end

        def save!(post)
          if post.nil?
            logger.debug("Post is duplicated.")
            return
          end

          if post.save!
            logger.debug("Post save Successfully.")
          else
            logger.error("Post save error occured #{post.errors.full_messages}")
          end
        end
    end
  end
end
