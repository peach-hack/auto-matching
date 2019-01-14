module AutoMatching
  module Reader
    class Pcmax < ReaderBase
      include Common::Pcmax
      include ValueConverter
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

          # 取得する大枠のテーブルを設定
          input_data = session.all(".item_box")

          # 各要素取得
          url = input_data.map { |value1| value1.find(".title_link")[:href] }
          title = input_data.map { |value1| value1.find(".title_link").text.strip.to_s }
          value = input_data.map { |value1| value1.first("span.value1").text }
          post_from = input_data.map { |value1| value1.all("span.value1")[1].text.strip.to_s }
          post_time = input_data.map { |value1| value1.all("span.value1")[2].text.strip.to_s }
          category = input_data.map { |value1| value1.all("span.value1")[3].text.strip.to_s }

          sex, name, age = name_age_sex_change(value)

          post_at = post_at_change(post_time)

          @from = from_change(post_from)

          # PCMAXのsource_sitesのIDは3のため
          source_site_id = 3

          # 配列の中にハッシュとして取得した要素を格納
          20.times.with_index do |i|
            number_of_fromdata = @from[i].length
            if number_of_fromdata = 3
              @prefecture = @from[i][0]
              @city = @from[i][1]
              @addres = @from[i][2]
            elsif number_of_fromdata = 2
              @prefecture = @from[i][0]
              @city = @from[i][1]
              @address = ""
            elsif number_of_fromdata = 1
              @prefecture = @from[i][0]
              @city = ""
              @address = ""
            end

            @prefecture = @prefecture.to_s.strip
            @city = @city.to_s.strip
            @address = @address.to_s.strip

            post_data = { source_site_id: source_site_id,
                          url: url[i], title: title[i], sex: sex[i], name: name[i],
                          age: age[i], post_at: post_at[i], category: category[i],
                          prefecture: @prefecture, city: @city, address: @address
                        }
            @post_data_list[i] = post_data
          end
          @post_data_list
        end

        def save_board
          @post_data_list.each do |d|

            profile = {}
            profile[:source_site_id] = d[:source_site_id]
            profile[:name] = d[:name]
            profile[:age] = d[:name]
            profile[:sex] = d[:sex]
            profile[:from] = 0

            post = {}
            post[:title] = d[:title]
            post[:post_at] = d[:post_at]
            post[:category] = d[:category]
            post[:prefecture] = d[:prefecture]
            post[:city] = d[:city]
            post[:address] = d[:address]

            @profile = Profile.new(profile)
            @post = @profile.build_post(post)

            if @post.save!
              logger.debug("成功しました")
            else
              logger.debug("失敗しました")
            end
          end
        end
    end
  end
end

