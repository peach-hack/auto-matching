module AutoMatching
  module Reader
    class Pcmax < ReaderBase
      include Common::Pcmax

      private
        def search_board

          # 検索ページに移動
          session.visit "https://pcmax.jp/mobile/bbs_reference.php"

          # 投稿地域
          session.find_field("pref_no").find("option[value='22']").select_option

          # 詳細地域
          # ジャンル
          session.execute_script "$('input.location_checkbox:checked').click()"
          session.execute_script "$('input#bbs_category9').click()"

          # 性別
          # 年齢
          # 体型
          # 詳細オプション
          # キーワード検索
          # 以前見た人を探す（必要ないかも）

          # 検索結果取得ページに遷移
          # session.find_button("submit").click
          # session.find(".btn").click
          # session.find_field("search").click
          session.execute_script "$('button.btn.moji_bold').click()"
        end

        def read_board
          puts "\n\nread_board\n\n"
          @list = []
          @data = {}

          # 取得する大枠のテーブルを設定
          # @data = session.find(:class, "item-box")

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

          # puts @data

          # @data[:name] = hoge
          # @data[:age] = 30

          # @list.add(@data)
        end

        def save_board
          # @list.each do | data |
          #   a = Post.new(name: data[:name], age: data[:age])
          #   a.save
          # end
          puts "\n\nsave_board\n\n"
        end
    end
  end
end
