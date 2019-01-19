module AutoMatching
  module Reader
    class Wakuwaku < ReaderBase
      include Common::Wakuwaku

      private
        def search_board
          logger.debug("search_board now")
          # TODO
          # 大人の募集 ※直リンクでいけた
          session.visit "https://550909.com/m/bbs/genre?menu=adult"

          # エリア選択　関東 > 東京都 > 新宿区　※直リンクでいけた
          session.visit "https://550909.com/m/setting/set_city?mode=area&city=227&pref=14"

          # すぐ会いたい ※直リンクでいけた
          session.visit "https://550909.com/m/bbs/list?genre=3"
        end

        def read_board
          logger.debug("read_board now")
          # TODO
        end

        def save_board
          logger.debug("save_board now")
          # TODO
        end
    end
  end
end
