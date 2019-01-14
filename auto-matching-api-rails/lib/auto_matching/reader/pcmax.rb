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
          # 各種初期設定
          input_data = []
          post_data = {}
          @post_data_list = []

          sex = []
          name = []
          age = []
          post_at = []
          from = []

          # 取得する大枠のテーブルを設定
          input_data = session.all(".item_box")

          # 各要素取得
          url = input_data.map { |value1| value1.find(".title_link")[:href] }
          title = input_data.map { |value1| value1.find(".title_link").text.strip.to_s }
          value = input_data.map { |value1| value1.first("span.value1").text }
          post_from = input_data.map { |value1| value1.all("span.value1")[1].text.strip.to_s }
          post_time = input_data.map { |value1| value1.all("span.value1")[2].text.strip.to_s }
          category = input_data.map { |value1| value1.all("span.value1")[3].text.strip.to_s }

          value.each_with_index do |v, i|
            t = v.split(" ")
            s, n, a = t
            sex_i = (s == "♀" ? 1 : 0)

            sex.push(sex_i)
            name.push(n)
            age.push(a)
          end

          # 日付型に変更
          post_time.each do |date|
            post_at.push(Time.strptime(date, "%Y年%m月%d日 %H:%M"))
          end

          # 都道府県番号に変更(string -> integer(1-47))
          post_from.each do |args|
            # テスト用　↓どこかに移動させたい
            from_data = 0
            if args.include?("北海道")
              from_data = 1 # 北海道
            elsif args.include?("青森")
              from_data = 7 # 青森
            elsif args.include?("東京")
              from_data = 22 # 東京
            end

            from.push(from_data)
          end

          # PCMAXのsource_sitesのIDは3のため
          source_site_id = 3

          # 配列の中にハッシュとして取得した要素を格納
          20.times.with_index do |i|
            post_data = { source_site_id: source_site_id,
                          url: url[i], title: title[i], sex: sex[i], name: name[i],
                          age: age[i], from: from[i], post_at: post_at[i], category: category[i]
                        }

            @post_data_list[i] = post_data
          end

          @post_data_list
        end

        def save_board
          @post_data_list.each do |d|
            # ProfileとPostに一括登録の模索１
            # params = { profile: { source_site_id: d[:source_site_id], name: d[:name], age: d[:age], sex: d[:sex], from: d[:from],
            #             post_attributes: { title: d[:title], post_at: d[:post_at], category: d[:category], area: d[:from]
            #           } } }
            # post_save_data = Profile.new(params[:profile])

            # ProfileとPostに一括登録の模索２
            profile = {}
            profile[:source_site_id] = d[:source_site_id]
            profile[:name] = d[:name]
            profile[:age] = d[:name]
            profile[:sex] = d[:sex]
            profile[:from] = 0 # 一旦0で登録。※1
            # ※1：サイトによって、プロフィールの所属地域と投稿地域が異なる場合を許すことがありますが、たしか課金(10円)じゃないとその情報はとれなかった気がします。

            post = {}
            post[:title] = d[:title]
            post[:post_at] = d[:post_at]
            post[:category] = d[:category]
            post[:area] = d[:from]

            @profile = Profile.create(profile)
            @post = @profile.build_post(post)

            if @post.save!
              logger.debug("\n 成功しました \n")
            else
              logger.debug("\n 失敗しました \n")
            end
          end
        end
    end
  end
end
