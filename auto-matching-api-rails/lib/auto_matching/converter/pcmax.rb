module AutoMatching
  module Converter
    class Pcmax < ConverterBase
      # valueには性別、名前、年齢が格納されているためそれぞれ分割
      def split_value(value)
        sex_list = []
        name_list = []
        age_list = []

        value.each do |v|
          sex, name, age = split_sex_name_age(v)

          sex_list.push(sex)
          name_list.push(name)
          age_list.push(age)
        end

        [sex_list, name_list, age_list]
      end

      def split_sex_name_age(line)
        sex_tmp, name_tmp, age_tmp = line.split(" ")

        sex = convert_to_sex(sex_tmp)

        name = name_tmp.strip

        age = convert_to_generation(age_tmp.chop.to_i)

        [sex, name, age]
      end

      # post_atは文字列で格納されているため日付型に変更
      def value_change_post_at(post_time)
        post_at = []

        post_time.each do |date|
          date.gsub!(/(年|月|日)/, "年" => "-", "月" => "-", "日" => "-")
          post_at.push(Time.zone.parse(date))
        end

        post_at
      end

      def from_change(post_from)
        post_from_list = value_change_from(post_from)
        prefecture_list, city_list, address_list = split_post_from(post_from_list)
        [prefecture_list, city_list, address_list]
      end

      # post_fromは住所を丸々格納しているのでそれぞれ分割
      # 例：神奈川県川崎市中原区 → 神奈川県、川崎市、中原区
      def value_change_from(post_from)
        from_list = []

        post_from.each do |v|
          from = convert_to_split_from(v)
          from_list.push(from)
        end

        from_list
      end

      # 分割された住所を確変数に割り当てる
      def split_post_from(from)
        prefecture_list = []
        city_list = []
        address_list = []

        from.each_with_index do |v, i|
          prefecture, city, address = convert_to_from(v)

          prefecture_list.push(prefecture.to_s.strip)
          city_list.push(city.to_s.strip)
          address_list.push(address.to_s.strip)
        end

        [prefecture_list, city_list, address_list]
      end
    end
  end
end
