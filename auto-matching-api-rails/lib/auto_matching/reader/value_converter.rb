module AutoMatching
  module Reader
    module ValueConverter
      class PcmaxConverter
        # 定数をどこかに移動させたい...（メソッド内に定数は定義できないらしいのでこちらに）
        FROM_PREFECTURE_REGEX = /(...??[都道府県])/
        FROM_CITY_REGEX = /(...??[都道府県])(...??[市区町村])/
        FROM_ALL_REGEX = /(...??[都道府県])((?:旭川|伊達|石狩|盛岡|奥州|田村|南相馬|那須塩原|東村山|武蔵村山|羽村|十日町|上越|富山|野々市|大町|蒲郡|四日市|姫路|大和郡山|廿日市|下松|岩国|田川|大村)市|.+?郡(?:玉村|大町|.+?)[町村]|.+?市.+?区|.+?[市区町村])(.+)/


        # valueには性別、名前、年齢が格納されているためそれぞれ分割
        def split_value(value)
          sex = []
          name = []
          age = []

          value.each_with_index do |v, i|
            after_value = v.split(" ")
            sex_tmp, name_tmp, age_tmp = after_value

            sex_i = (sex_tmp == "♀" ? 1 : 0)

            name_s = name_tmp.strip

            unless age_tmp.include?("歳")
              a_i = age_tmp.gsub(/歳/, "").to_i
            else
              a_i = age_tmp.to_i
            end

            sex.push(sex_i)
            name.push(name_s)
            age.push(a_i)
          end

          return sex, name, age
        end

        # post_atは文字列で格納されているため日付型に変更
        def value_change_post_at(post_time)
          post_at = []

          post_time.each do |date|
            post_at.push(Time.strptime(date, "%Y年%m月%d日 %H:%M"))
          end

          post_at
        end

        # post_fromは住所を丸々格納しているのでそれぞれ分割
        # 例：神奈川県川崎市中原区 → 神奈川県、川崎市、中原区
        def value_change_from(post_from)
          from = []

          post_from.each do |args|
            unless args.include?("都")
              unless args.include?("県")
                if args.size = 2
                  args << "県"
                else
                  args.insert(2, "県")
                end
              end
              if args.include?("北海道")
                # 何もしない
              elsif args.include?("東京")
                args.insert(2, "都")
              end
            end

            if args.match(FROM_PREFECTURE_REGEX)
              from.push(args.match(FROM_PREFECTURE_REGEX).captures)
            elsif args.match(FROM_CITY_REGEX)
              from.push(args.match(FROM_CITY_REGEX).captures)
            else
              from.push(args.match(FROM_ALL_REGEX).captures)
            end
          end

          from
        end

        # 分割された住所を確変数に割り当てる
        def split_from(from)
          prefecture = []
          city = []
          address = []

          from.each_with_index do |f, i|
            number_of_fromdata = f.length
            if number_of_fromdata == 3
              add_prefecture = f[0]
              add_city = f[1]
              add_address = f[2]
            elsif number_of_fromdata == 2
              add_prefecture = f[0]
              add_city = f[1]
              add_address = ""
            elsif number_of_fromdata == 1
              add_prefecture = f[0]
              add_city = ""
              add_address = ""
            end

            prefecture.push(add_prefecture.to_s.strip)
            city.push(add_city.to_s.strip)
            address.push(add_address.to_s.strip)
          end

          return prefecture, city, address
        end
      end
    end
  end
end
