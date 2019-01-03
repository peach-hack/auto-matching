module AutoMatching
  module Reader
    class Pcmax < ReaderBase
      include Common::Pcmax

      private
        def read_board
          # 検索ページに移動
          session.visit 'https://pcmax.jp/mobile/bbs_reference.php'

          session.execute_script "$('input.location_checkbox:checked').click()"
          session.execute_script "$('input#bbs_category9').click()"

          # 投稿地域
          # select = Selenium::WebDriver::Support::Select.new(session.find_element(:tabindex, '6'))
          # select = Selenium::WebDriver::Support::Select.new(session.find_element(:name, 'pref_no'))
          # ele = sssion.find_element(:name, 'pref_no')
          # select.select_by(:value, '22')
          session.find_element(:name, 'pref_no').select_by(:value, '22')

          # 詳細地域
          # ジャンル
          session.find_element(:name, 'bbs_category[9]').click

          # 性別
          # 年齢
          # 体型
          # 詳細オプション
          # キーワード検索
          # 以前見た人を探す（必要ないかも）

          # 検索結果取得ページに遷移
          session.find_element(:name, 'search').click

          # 取得する大枠のテーブルを設定
          element = session.find_element(:class, 'list')

          # # 取得する情報分繰り返す #めんどくさそうなので一旦保留
          # unless element.present?
          #   begin
          #     title = element.match("")
          #     name =
          #     age =
          #     from =
          #     post_at =

          #   rescue Selenium::WebDriver::Error::NoSuchElementError => e
          #     raise e.message
          #     session.quit
          #   end
          # end
          
          puts element
        end
    end
  end
end
