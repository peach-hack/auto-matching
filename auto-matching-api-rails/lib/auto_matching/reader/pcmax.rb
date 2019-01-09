module AutoMatching
  module Reader
    class Pcmax < ReaderBase
      include Common::Pcmax
      require "date"

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
          session.execute_script "$('button.btn.moji_bold').click()"
        end

        def read_board
          #各種初期設定
          input_data = []
          post_data = {}
          @post_data_list = []

          sex =[]
          name = []
          age = []
          post_at = []

          # 取得する大枠のテーブルを設定
          input_data = session.all(".item_box")

          #各要素取得
          url = input_data.map {|url| url.find(".title_link")[:href] }
          title = input_data.map {|title| title.find(".title_link").text.strip.to_s }
          value = input_data.map {|value1| value1.first("span.value1").text }
          from = input_data.map {|value1| value1.all("span.value1")[1].text.strip.to_s }
          post_time = input_data.map {|value1| value1.all("span.value1")[2].text.strip.to_s }
          category = input_data.map {|value1| value1.all("span.value1")[3].text.strip.to_s }

          value.each_with_index do |v,i|
            t = v.split(" ")
            s,n,a = t
            sex_i = s = "♀" ? 1 : 0 #性別も日付同様に保留のため文字列のまま

            sex.push(sex_i)
            name.push(n)
            age.push(a)
          end

          #日付型に変更途中(一旦保留なので文字列のまま)
          post_time.each do |date|
            post_at.push(Time.strptime(date, "%Y年%m月%d日 %H:%M"))
          end

          #配列の中にハッシュとして取得した要素を格納
          20.times.with_index do |i|
            post_data = { url: url[i], title: title[i], sex: sex[i], name: name[i], age: age[i], from: from[i], post_at: post_at[i], category: category[i]}
            @post_data_list[i] = post_data
          end

          @post_data_list
        end

        def save_board
          puts "\n\nsave_board\n\n"

          #▼確認用(あとで消す)
          #------------------
          # puts "\n\n"
          # puts @list

          # puts "\n\n"
          # #取り出し方
          # test = @list[5]
          # puts test[:title]
          #------------------

          @post_data_list.each do |d|
            # post_save_data = Post.new(d[:url], d[:title], d[:sex], d[:name], d[:age], d[:from], d[:post_at], d[:category])
            # post_save_data.save!
          end
        end
    end
  end
end
