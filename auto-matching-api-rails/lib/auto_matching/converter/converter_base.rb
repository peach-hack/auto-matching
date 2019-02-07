module AutoMatching
  module Converter
    class ConverterBase
      FROM_PREFECTURE_REGEX = /(...??[都道府県])/
      FROM_CITY_REGEX = /(...??[都道府県])(...??[市区町村])/
      FROM_ALL_REGEX = /(...??[都道府県])((?:旭川|伊達|石狩|盛岡|奥州|田村|南相馬|那須塩原|東村山|武蔵村山|羽村|十日町|上越|富山|野々市|大町|蒲郡|四日市|姫路|大和郡山|廿日市|下松|岩国|田川|大村)市|.+?郡(?:玉村|大町|.+?)[町村]|.+?市.+?区|.+?[市区町村])(.+)/
      REGEX_SHIKUCHOSON = /(市|区|町|群)/
      FROM_TO_TOKYO = "東京都"
      CATEGORY_NOW = "スグ会いたい"
      CATEGORY_AFTER = "スグじゃないけど"
      CATEGORY_ABNORMAL = "アブノーマル"

      def convert_to_generation(age)
        if age < 20
          "18-19歳"
        elsif age < 24
          "20代前半"
        elsif age < 27
          "20代半ば"
        elsif age < 30
          "20代後半"
        elsif age < 34
          "30代前半"
        elsif age < 37
          "30代半ば"
        elsif age < 40
          "30代後半"
        elsif age < 44
          "40代前半"
        elsif age < 47
          "40代半ば"
        elsif age < 50
          "40代後半"
        elsif age < 54
          "50代前半"
        elsif age < 57
          "50代半ば"
        elsif age < 60
          "50代後半"
        else
          "60歳以上"
        end
      end

      def convert_to_sex(sex)
        sex == "♀" ? "女性" : "男性"
      end
    end
  end
end
