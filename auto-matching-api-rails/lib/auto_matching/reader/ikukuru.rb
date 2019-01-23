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

          # TODO
          logging_end(__method__)
        end

        def read_board
          logging_start(__method__)
          post_data = {}
          @post_data_list = []
          name = []
          age = []
          value00 = []
          regex_ken = /都道府県/
          from_to_tokyo = " 東京都"

          from_prefecture = []
          from_city = []
          # TODO

          # input_data = session.all(".bgMiddle")
          # value00 = session.all(".contentsTextContribute").map { |t| t.all(".refinedBbsDesign")[2] }
          # .miniCarIconがあるとspan = 4 , .miniNewFaceIconがあるとspan = 4, 両方あるとspan = 5
          span_number = session.all(".contentsTextContribute").map { |t| t.all(:css, "span").size }


          logger.debug("\n\n#{span_number}\n\n")
          span_number.each_with_index do |v, i|
            if v == 5
              logger.debug("5now")
              value00 = session.all(".contentsTextContribute").map { |t| t.all(:css, "span")[3] }
              # from_city[i] = session.all(".contentsTextContribute").map { |t| t.all(:css, "span")[3].text }
            elsif v == 4
              logger.debug("4now")
              value00 = session.all(".contentsTextContribute").map { |t| t.all(:css, "span")[2] }
            elsif v == 3
              logger.debug("3now")
              value00 = session.all(".contentsTextContribute").map { |t| t.all(:css, "span")[1] }
              # from_city[i] = ""
            end
          end
          from = value00.map { |t| t.text }

          # if span .miniCarIcon != nil && span .miniNewFaceIcon != nil
          #   # span 5 で 4つ目のみ取得
          # elsif span .miniCarIcon = nil && span .miniNewFaceIcon != nil
          #   # span 4 で 3つ目のみ取得
          # elsif span .miniCarIcon != nil && span .miniNewFaceIcon = nil
          #   # span 4 で 3つ目のみ取得　例： 3:杉並区(旅行とか) 4:本住所
          # elsif span .miniCarICon = nil && span .miniNewFaceIcon = nil
          #   # span 4 で 2つ目のみ取得
          #   value00 = session.all(".contentsTextContribute").map { |t| t.all(:css, "span")[1] }
          # end
          
          value = session.all(".contentsTextContribute").map { |t| t.first(".refinedBbsDesign") }


          # 取得する大枠のテーブル設定
          get_time = session.all(".timeContribute")
          get_title = session.all(".textComment")
          # get_value1 = session.all(".woman")
          # get_title = session.all(".")
          # get_title = session.all(".")
          # get_title = session.all(".")
          # get_title = session.all(".")

          post_at = get_time.map { |t| t.text.strip }
          title = get_title.map { |t| t.text.strip }
          sex = value.map { |t| t.find("span.woman").text.strip }
          value1 = value.map { |t| t.text.gsub(/♀/, "") }
          
          


          value1.each do |v|
            tmp_name, tmp_age = v.split(" ")
            name.push(tmp_name.strip)
            age.push(tmp_age.strip)
          end

          logger.debug(post_at)
          logger.debug(title)
          logger.debug(sex)
          logger.debug(name)
          logger.debug(age)
          logger.debug(from)

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
