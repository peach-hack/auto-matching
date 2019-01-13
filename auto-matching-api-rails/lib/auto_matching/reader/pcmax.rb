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
          url = input_data.map { |url| url.find(".title_link")[:href] }
          title = input_data.map { |title| title.find(".title_link").text.strip.to_s }
          value = input_data.map { |value1| value1.first("span.value1").text }
          from = input_data.map { |value1| value1.all("span.value1")[1].text.strip.to_s }
          post_time = input_data.map { |value1| value1.all("span.value1")[2].text.strip.to_s }
          category = input_data.map { |value1| value1.all("span.value1")[3].text.strip.to_s }

          value.each_with_index do |v, i|
            t = v.split(" ")
            s, n, a = t
            sex_i = s = "♀" ? 1 : 0

            sex.push(sex_i)
            name.push(n)
            age.push(a)
          end
          puts "\n\n\n read_board1 \n\n\n"

          #日付型に変更
          post_time.each do |date|
            post_at.push(Time.strptime(date, "%Y年%m月%d日 %H:%M"))
          end

          #都道府県番号に変更(string -> integer(1-49))
          #別ブロックにして呼び出す
          #あとで作成する

          # PCMAXのsource_sitesのIDは3のため
          source_site_id = 3
          puts "\n\n\n read_board2 \n\n\n"

          #配列の中にハッシュとして取得した要素を格納
          20.times.with_index do |i|
            post_data = {source_site_id: source_site_id, url: url[i], title: title[i], sex: sex[i], name: name[i],
                            age: age[i], from: from[i], post_at: post_at[i], category: category[i]
                        }

            @post_data_list[i] = post_data
          end

          puts "\n\n\n read_board3 \n\n\n"
          @post_data_list
        end

        def save_board
          puts "\n\n\n save_board \n\n\n"

          #▼確認用(あとで消す)
          #------------------
          # puts "\n\n"
          # puts @list

          # puts "\n\n"
          # #取り出し方
          # test = @list[5]
          # puts test[:title]
          #------------------
          # begin
          #   last_record = Profile.last
          # rescue ActiveRecord::RecordNotFound => e
          #   # last_no = 0 unless last_no.present?
          #   last_no = 0
          #   puts "レコードが見つかりません"
          # end
          # last_no = last_record.id

          # last_no = 0

          # puts "\n\n\n #{@post_data_list.count} \n\n\n"
          @post_data_list.each do |d|

            puts "\n\n\n #{d} \n\n\n"

            # #ProfileとPostに一括登録の模索１
            # #  id | source_site_id | name | age | sex | from | created_at | updated_at
            # post_save_data = Profile.new( source_site_id: d[:source_site_id], name: d[:name], age: d[:age], sex: d[:sex], from: d[:from] )
            # #post_save_data = Profile.new(d[:source_site_id], i, d[:url], d[:title], d[:sex], d[:name], d[:age], d[:from])

            # puts "\n\n\n new OK \n\n\n"
            # if post_save_data.save!
            #   puts "\n\n\n 成功しました \n\n\n"
            # else
            #   puts "\n\n\n 失敗しました \n\n\n"
            # end

          end

          # private
          # def post_data_params
          #   @post_data_list.require(:profile).permit(:source_site_id, :name, :age, :sex, :from, post: [:profile_id, :title, :post_at, :category, :area])
          # end
        end
    end
  end
end
