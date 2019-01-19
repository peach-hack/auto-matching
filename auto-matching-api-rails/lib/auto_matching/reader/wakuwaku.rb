module AutoMatching
  module Reader
    class Wakuwaku < ReaderBase
      include Common::Wakuwaku

      private
        def search_board
          logging_start(__method__)

          # すぐ会いたい ※直リンクでいけた
          session.visit "https://550909.com/m/bbs/list?genre=3"
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
          value.each do |v1|
            sex_tmp, add_name = v1.split(/\A(.{1})/, 2)[1..-1]
            sex_i = (sex_tmp == "♀" ? 1 : 0)
            add_sex = (sex_i == 1 ? "女性" : "男性")
            sex.push(add_sex)
            name.push(add_name)
          end

          # 年齢、市区町村を分割
          value2.each do |v2|
            add_age, add_city = v2.split(" ")
            age.push(add_age)
            city.push(add_city)
          end
          # # これは数字だけ取り出す処理　Converterで使えるかもなので保留
          # # age = a.gsub(/[^\d]/, "").to_i

          # 投稿日を変換
          post_time.each do |v3|
            # なんか、RailsだとActiveSupport::TimeWithZoneを使う方がいいらしい
            now = Time.current
            v3.insert(0, "#{now.year}/")
            logger.debug(v3)
            post_at.push(Time.zone.parse(v3))
          end

          # WAKUWAKUのsource_site_idは2のため
          source_site_id = 2

          # 配列の中にハッシュとして取得した要素を格納
          20.times.with_index do |i|
            post_data = { source_site_id: source_site_id,
                          url: url[i], title: title[i], sex: sex[i], name: name[i],
                          age: age[i], post_at: post_at[i], category: category[i],
                          prefecture: prefecture, city: city[i] #, address: address[i]
                        }
            @post_data_list[i] = post_data
          end

          @post_data_list
        end

        def save_board
          logging_start(__method__)

          @post_data_list.each do |d|
            logger.debug("\n\n ここで取得テスト \n\n")
            logger.debug("url:#{d[:url]}")
            logger.debug("source_site_id:#{d[:source_site_id]}")
            logger.debug("name:#{d[:name]}")
            logger.debug("age:#{d[:age]}")
            logger.debug("sex:#{d[:sex]}")
            logger.debug("title:#{d[:title]}")
            logger.debug("post_at:#{d[:post_at]}")
            logger.debug("category:#{d[:category]}")
            logger.debug("prefecture:#{d[:prefecture]}")
            logger.debug("city:#{d[:city]}")
            logger.debug("\n\n ここまでテスト \n\n")
          end
        end
    end
  end
end
