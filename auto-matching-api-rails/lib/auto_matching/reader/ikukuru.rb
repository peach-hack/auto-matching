module AutoMatching
  module Reader
    class Ikukuru < ReaderBase
      include Common::Ikukuru

      AREA_MAPPER = {
        "東京都" => "https://sp.194964.com/bbs/exec_bbs_area_move.html?q=a2YxRkxVbk15bUc5OVJQQnFTbE4yS2N4NVNVUmdOZUtVZkNFbm8yMmtqcz0%3D",
        "神奈川県" => "https://sp.194964.com/bbs/exec_bbs_area_move.html?q=by9qUHBrQTl5eVJ6bnMvcnBzelZEWDlOZGc2V2pyMkRyT3YzSzJraWtTaz0%3D"
      }

      private
        def specify_area
          logging_start(__method__)

          session.visit "https://sp.194964.com/bbs/show_genre.html?q=cm1BMmxOeU8zZE1tbnFkUzFmUWs3dz09"

          # 地域を移動
          session.visit "https://sp.194964.com/bbs/show_bbs_area_move.html?q=aTJVNnJuMDg5NVdhLytYK05tbG1vUT09"

          session.visit AREA_MAPPER[area]

          logging_end(__method__)
        end

        def search_board
          logging_start(__method__)

          # いますぐ会いたい
          session.visit "https://sp.194964.com/bbs/show_bbs.html?q=ZTJvTzJzRGhPQW5yRmsrdm5KeXhFdz09"

          logging_end(__method__)
        end

        def read_board
          logging_start(__method__)
          post_data = {}
          @post_data_list = []

          converter = AutoMatching::Converter::Ikukuru.new

          value01 = []


          # TODO
          # 取得する大枠のテーブル設定
          value00 = session.all(".contentsTextContribute").map { |t| t.first(".refinedBbsDesign") }
          get_time = session.all(".timeContribute")
          get_post_title = session.all(".textComment")
          get_url = session.all(".textComment").map { |t| t.find(".refinedBbsDesign") }

          # fromが格納されている部分の取得
          POST_COUNT.times do
            value01 = session.all(".contentsTextContribute").each { |t|
              t.all(:css, "span")
            }
          end

          # 各要素取得
          category_list = converter.convert_category(session.find("#title").text.strip)
          get_post_at = get_time.map { |t| t.text.strip }
          url_list = get_url.map { |t| t[:href] }
          title_list = get_post_title.map { |t| t.text.strip }
          get_sex = value00.map { |t| t.find("span.woman").text.strip }
          get_name_age = value00.map { |t| t.text.gsub(/♀/, "") }
          get_from = value01.map { |t| t.text }

          from_list, trip_from_list = converter.split_from_value(get_from)

          # Sider落ちるため保存はしませんが、旅行先の住所を格納している変数を下に記述しておく
          trip_from_list

          sex_list = converter.sex_value_change(get_sex)

          name_list, age_list = converter.split_name_age_value(get_name_age)

          post_at_list = converter.post_at_value_change(get_post_at)

          source_site_id = SourceSite.find_by(key: SourceSite::KEY_IKUKURU).id

          # postsのprefecture,city,addressには何も設定しない
          prefecture_list = ""
          city_list = ""
          address_list = ""

          # 配列の中にハッシュとして取得した要素を格納
          POST_COUNT.times.with_index do |i|
            post_data = { source_site_id: source_site_id,
              url: url_list[i], title: title_list[i], sex: sex_list[i], name: name_list[i],
              age: age_list[i], post_at: post_at_list[i], category: category_list,
              prefecture: prefecture_list, city: city_list, address: address_list, from: from_list[i]
            }
            @post_data_list[i] = post_data
          end

          logging_end(__method__)
        end

        def click_next
          session.click_link "次を表示"
        end
    end
  end
end
