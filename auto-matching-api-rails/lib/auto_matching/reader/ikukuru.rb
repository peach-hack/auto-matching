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
          #session.visit "https://sp.194964.com/bbs/show_bbs.html?q=TTVzV090eEJFdG42aEc3ZnYzeitXZz09"

          # TODO
          logging_end(__method__)
        end

        def read_board
          logging_start(__method__)
          post_data = {}
          @post_data_list = []

          name = []
          age = []
          sex = []

          value00 = []
          value01 = []
          regex_ken = /都道府県/
          regex_ken_shikuchoson = /(...??[都道府県])(...??[市区町村])/
          regex_shikuchoson = /(市|区|町|群)/
          from_to_tokyo = "東京都"
          from = []
          from_trip = []

          # TODO
          # 取得する大枠のテーブル設定
          value1 = session.all(".contentsTextContribute").map { |t| t.first(".refinedBbsDesign") }
          get_time = session.all(".timeContribute")
          get_title = session.all(".textComment")

          # from_cityの取得
          # clober = ".miniNewFaceIcon"
          number = session.all(".contentsTextContribute").map { |t| t.all(:css, "span").size }

          # 普通の状態の情報を取得 #number じゃなくてもよくなりましたが、一旦これで...あとあと直す
          number.each do |i|
            pointer = 2
            value00 = session.all(".contentsTextContribute").each { |t|
              # pointer = 3 if t.has_no_content?(clober) #できなかった...
              t.all(:css, "span")
            }
          end
          # # 初心者マークのある情報を取得
          # number.each do |i|
          #   pointer = 1 # ここは機能してないかも...
          #   value01 = session.all(".contentsTextContribute").map { |t|
          #     pointer = 3 if t.has_no_content?(clober)
          #     logger.debug("\n\n#{pointer}\n\n")
          #     t.all(:css, "span")[i - pointer]
          #   }
          # end


          # 各要素取得
          post_at = get_time.map { |t| t.text.strip }
          title = get_title.map { |t| t.text.strip }
          get_sex = value1.map { |t| t.find("span.woman").text.strip }
          get_name_and_age = value1.map { |t| t.text.gsub(/♀/, "") }
          add_from = value00.map { |t| t.text }
          
          add_from.each_with_index do |v, i|
            tmp_v = v.split(" ").last
            kugiri = tmp_v.index(regex_shikuchoson)
            city = tmp_v[0..kugiri]
            prefecture = tmp_v[kugiri + 1..-1]
            
            if prefecture.blank?
              from.push(from_to_tokyo + city)
            else
              from.push(prefecture)
              from_trip.push(city)
            end
            
          end


          # from_clover = value01.map { |t| t.text }

          # # 空白（初心者マークの情報）をマージして空白をなくす
          # from.each_with_index do |v, i|
          #   from[i] = from_clover[i] if v.blank?
          # end

          # 性別の変換
          get_sex.each do |v|
            add_sex = (v == "♀" ? "女性" : "男性")
            sex.push(add_sex.to_s.strip)
          end

          # 名前と年齢の分割
          get_name_and_age.each do |v|
            tmp_name, tmp_age = v.split(" ")
            name.push(tmp_name.strip)
            age.push(tmp_age.strip)
          end

          # 取得状況テスト
          logger.debug(post_at)
          logger.debug(title)
          logger.debug(sex)
          logger.debug(name)
          logger.debug(age)
          logger.debug(from)
          logger.debug(from_trip)

          logging_end(__method__)
        end

        def save_board
          logging_start(__method__)
          # TODO

          logging_end(__method__)
        end
    end
  end
end
