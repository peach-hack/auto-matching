module AutoMatching
  module Converter
    class Wakuwaku < ConverterBase
      SITE_ID = "wakuwaku"

      # 性別、名前を分割
      def sex_name_split_value(value)
        sex_list = []
        name_list = []

        value.each do |v|
          tmp_sex, name = v.split(/\A(.{1})/, 2)[1..-1]
          tmp_sex = tmp_sex.to_s unless tmp_sex.kind_of?(String)
          sex = convert_to_sex(tmp_sex)
          sex_list.push(sex.to_s.strip)
          name_list.push(name.to_s.strip)
        end
        [sex_list, name_list]
      end

      # 年齢、市区町村を分割
      def age_city_split_value(value2)
        age_list = []
        city_list = []

        value2.each do |v|
          age, city = v.split(" ")
          age_list.push(age.to_s.strip)
          city_list.push(city.to_s.strip)
        end
        [age_list, city_list]
      end

      # 投稿日を変換
      def post_at_change_value(post_time)
        post_at_list = []

        post_time.each do |date|
          now = Time.current
          post_at = date.insert(0, "#{now.year}/")
          post_at_list.push(Time.zone.parse(post_at))
        end
        post_at_list
      end
    end
  end
end
