module AutoMatching
  module Reader
    class Pcmax < ReaderBase
      include Common::Pcmax

      private
        def search_board
          logging_start(__method__)

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

          logging_end(__method__)
        end

        def read_board
          logging_start(__method__)

          # 各種初期設定
          post_data = {}
          @post_data_list = []
          converter = AutoMatching::Converter::Pcmax.new

          # 取得する大枠のテーブルを設定
          input_data = session.all(".item_box")

          # 各要素取得
          url_list = input_data.map { |value1| value1.find(".title_link")[:href] }
          title_list = input_data.map { |value1| value1.find(".title_link").text.strip.to_s }
          value = input_data.map { |value1| value1.first("span.value1").text }
          get_post_from = input_data.map { |value1| value1.all("span.value1")[1].text.strip.to_s }
          get_post_at = input_data.map { |value1| value1.all("span.value1")[2].text.strip.to_s }
          category_list = input_data.map { |value1| value1.all("span.value1")[3].text.strip.to_s }
          profile_from_list = input_data.map { |value1| value1.all("span.value1")[4].text.strip.to_s }


          sex_list, name_list, age_list = converter.split_value(value)

          post_at_list = converter.value_change_post_at(get_post_at)

          prefecture_list, city_list, address_list = converter.from_change(get_post_from)


          source_site_id = SourceSite.find_by(key: SourceSite::KEY_PCMAX).id

          # 配列の中にハッシュとして取得した要素を格納
          20.times.with_index do |i|
            post_data = { source_site_id: source_site_id,
                          url: url_list[i], title: title_list[i], sex: sex_list[i], name: name_list[i],
                          age: age_list[i], post_at: post_at_list[i], category: category_list[i],
                          prefecture: prefecture_list[i], city: city_list[i], address: address_list[i], from: profile_from_list[i]
                        }
            @post_data_list[i] = post_data
          end

          @post_data_list

          logging_end(__method__)
        end

        def save_board
          logging_start(__method__)

          @post_data_list.each do |d|
            profile = {}
            profile[:source_site_id] = d[:source_site_id]
            profile[:name] = d[:name]
            profile[:age] = d[:age]
            profile[:sex] = d[:sex]
            profile[:from] = d[:from]

            post = {}
            post[:title] = d[:title]
            post[:url] = d[:url]
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
          logging_end(__method__)
        end
    end
  end
end
