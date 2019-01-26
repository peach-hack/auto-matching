module AutoMatching
  module Reader
    class Ikukuru < ReaderBase
      include Common::Ikukuru

      private
        def search_board
          logging_start(__method__)

          # ヒミツ掲示板 → いますぐ会いたい
          session.visit "https://sp.194964.com/bbs/show_genre.html?q=cm1BMmxOeU8zZE1tbnFkUzFmUWs3dz09"

          # 地域を移動
          session.visit "https://sp.194964.com/bbs/show_bbs_area_move.html?q=aTJVNnJuMDg5NVdhLytYK05tbG1vUT09"

          # 東京 選択
          session.visit "https://sp.194964.com/bbs/exec_bbs_area_move.html?q=a2YxRkxVbk15bUc5OVJQQnFTbE4yS2N4NVNVUmdOZUtVZkNFbm8yMmtqcz0%3D"

          # いますぐ会いたい
          session.visit "https://sp.194964.com/bbs/show_bbs.html?q=ZTJvTzJzRGhPQW5yRmsrdm5KeXhFdz09"
          # session.visit "https://sp.194964.com/bbs/show_bbs.html?q=TTVzV090eEJFdG42aEc3ZnYzeitXZz09"

          # TODO
          logging_end(__method__)
        end

        def read_board
          logging_start(__method__)
          post_data = {}
          @post_data_list = []

          url_list = []
          title_list = []
          name_list = []
          age_list = []
          sex_list = []
          post_at_list = []

          value01 = []
          regex_ken = /都道府県/
          regex_ken_shikuchoson = /(...??[都道府県])(...??[市区町村])/
          regex_shikuchoson = /(市|区|町|群)/
          from_to_tokyo = "東京都"
          from_list = []
          from_trip_list = []

          # TODO
          # 取得する大枠のテーブル設定
          value00 = session.all(".contentsTextContribute").map { |t| t.first(".refinedBbsDesign") }
          get_time = session.all(".timeContribute")
          get_post_title = session.all(".textComment")
          get_url = session.all(".textComment").map { |t| t.find(".refinedBbsDesign") }

          # fromが格納されている部分の取得
          15.times do
            value01 = session.all(".contentsTextContribute").each { |t|
              t.all(:css, "span")
            }
          end

          # 各要素取得
          category_list = session.find("#title").text.strip
          get_post_at = get_time.map { |t| t.text.strip }
          get_url = get_url.map { |t| t[:href] }
          get_title = get_post_title.map { |t| t.text.strip }
          get_sex = value00.map { |t| t.find("span.woman").text.strip }
          get_name_age = value00.map { |t| t.text.gsub(/♀/, "") }
          get_from = value01.map { |t| t.text }

          get_from.each do |v|
            tmp_v = v.split(" ").last
            kugiri = tmp_v.index(regex_shikuchoson)
            city = tmp_v[0..kugiri]
            prefecture = tmp_v[kugiri + 1..-1]

            if prefecture.blank?
              from_list.push(from_to_tokyo + city)
            else
              from_list.push(prefecture)
              from_trip_list.push(city)
            end
          end

          # 性別の変換
          get_sex.each do |v|
            add_sex = (v == "♀" ? "女性" : "男性")
            sex_list.push(add_sex.to_s.strip)
          end

          # 名前と年齢の分割
          get_name_age.each do |v|
            add_name, add_age = v.split(" ")
            name_list.push(add_name.strip)
            age_list.push(add_age.strip)
          end

          # 投稿時間の変換
          get_post_at.each do |date|
            now = Time.current
            date.insert(0, "#{now.year}/")
            post_at_list.push(Time.zone.parse(date))
          end

          source_site_id = SourceSite.find_by(key: SourceSite::KEY_IKUKURU).id

          # postsのprefecture,city,addressには何も設定しない
          prefecture_list = ""
          city_list = ""
          address_list = ""

          # 配列の中にハッシュとして取得した要素を格納
          15.times.with_index do |i|
            post_data = { source_site_id: source_site_id,
              url: get_url[i], title: get_title[i], sex: sex_list[i], name: name_list[i],
              age: age_list[i], post_at: post_at_list[i], category: category_list,
              prefecture: prefecture_list, city: city_list, address: address_list, from: from_list[i]
            }
            @post_data_list[i] = post_data
          end

          logging_end(__method__)
        end

        def save_board
          logging_start(__method__)
          # TODO
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
