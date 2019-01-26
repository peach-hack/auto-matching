module AutoMatching
  module Reader
    class Wakuwaku < ReaderBase
      include Common::Wakuwaku

      private
        def search_board
          logging_start(__method__)

          # アダルトのすぐ会いたい ※直リンクでいけた
          session.visit "https://550909.com/m/bbs/list?genre=3"

          logging_end(__method__)
        end

        def read_board
          logging_start(__method__)

          post_data = {}
          @post_data_list = []

          sex = []
          name = []
          age = []
          city = []
          post_at = []

          # 取得する大枠のテーブルを設定
          url_list = session.all(".rightBtn")
          title_list = session.all(".message")
          category_list = session.all(".category1")
          value_list = session.all(".name")
          value2_list = session.all(".age")
          post_at_list = session.all(".time")

          # 各要素取得
          prefecture = session.find(".subHeaderBBS").text.gsub(/エリア：/, "").strip
          url = url_list.map { |t| t[:href] }
          title = title_list.map { |t| t.text.strip.to_s }
          category = category_list.map { |t| t.text.strip.to_s }
          value = value_list.map { |t| t.text.strip.to_s }
          value2 = value2_list.map { |t| t.text.strip.to_s }
          post_time = post_at_list.map { |t| t.text.strip.to_s }

          # 性別、名前を分割
          value.each do |v|
            sex_tmp, add_name = v.split(/\A(.{1})/, 2)[1..-1]
            add_sex = (sex_tmp == "♀" ? "女性" : "男性")
            sex.push(add_sex.to_s.strip)
            name.push(add_name.to_s.strip)
          end

          # 年齢、市区町村を分割
          value2.each do |v|
            add_age, add_city = v.split(" ")
            age.push(add_age.to_s.strip)
            city.push(add_city.to_s.strip)
          end

          # 投稿日を変換
          post_time.each do |date|
            now = Time.current
            date.insert(0, "#{now.year}/")
            post_at.push(Time.zone.parse(date))
          end

          source_site_id = SourceSite.find_by(key: SourceSite::KEY_WAKUWAKU).id

          # addressには何も設定しない
          address = ""

          # 配列の中にハッシュとして取得した要素を格納
          20.times.with_index do |i|
            post_data = { source_site_id: source_site_id,
                          url: url[i], title: title[i], sex: sex[i], name: name[i],
                          age: age[i], post_at: post_at[i], category: category[i],
                          prefecture: prefecture, city: city[i], address: address
                        }
            @post_data_list[i] = post_data
          end

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
            profile[:from] = 0

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
