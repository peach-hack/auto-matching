module AutoMatching
  module Converter
    class Ikukuru < ConverterBase
      SITE_ID = "ikukuru"

      def convert_category(category)
        if category == "ヒミツ掲示板"
          CATEGORY_NOW
        end
      end

      # 性別を変換
      def sex_value_change(get_sex)
        sex_list = []

        get_sex.each do |v|
          v = v.to_s unless v.kind_of?(String)
          sex = convert_to_sex(v)
          sex_list.push(sex.to_s.strip)
        end
        sex_list
      end

      # 住所を分割
      def split_from_value(get_from)
        from_list = []
        from_trip_list = []

        get_from.each do |v|
          tmp_v = v.split(" ").last
          kugiri = tmp_v.index(REGEX_SHIKUCHOSON)
          from_city = tmp_v[0..kugiri]
          from_prefecture = tmp_v[kugiri + 1..-1]

          if from_prefecture.blank?
            from_list.push(FROM_TO_TOKYO + from_city)
          else
            from_list.push(from_prefecture)
            from_trip_list.push(from_city)
          end
        end
        [from_list, from_trip_list]
      end

      # 名前と年齢の分割
      def split_name_age_value(get_name_age)
        name_list = []
        age_list = []

        get_name_age.each do |v|
          add_name, add_age = v.split(" ")
          name_list.push(add_name.strip)
          age_list.push(add_age.strip)
        end
        [name_list, age_list]
      end

      # 投稿時間の変換
      def post_at_value_change(get_post_at)
        post_at_list = []

        get_post_at.each do |date|
          now = Time.current
          post_at = date.insert(0, "#{now.year}/")
          post_at_list.push(Time.zone.parse(post_at))
        end
        post_at_list
      end
    end
  end
end
