module AutoMatching
  module Reader
    class Wakuwaku < ReaderBase
      include Common::Wakuwaku

      def initialize
        super
        @page_no = 1
      end

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

          converter = AutoMatching::Converter::Wakuwaku.new

          # 取得する大枠のテーブルを設定
          get_url = session.all(".rightBtn")
          get_title = session.all(".message")
          get_category = session.all(".category1")
          value_list = session.all(".name")
          value2_list = session.all(".age")
          post_at_list = session.all(".time")

          # 各要素取得
          prefecture = session.find(".subHeaderBBS").text.gsub(/エリア：/, "").strip
          url_list = get_url.map { |t| t[:href] }
          title_list = get_title.map { |t| t.text.strip.to_s }
          category_list = get_category.map { |t| converter.convert_category(t.text.strip.to_s) }
          value = value_list.map { |t| t.text.strip.to_s }
          value2 = value2_list.map { |t| t.text.strip.to_s }
          get_post_at = post_at_list.map { |t| t.text.strip.to_s }

          sex_list, name_list = converter.sex_name_split_value(value)

          age_list, city_list = converter.age_city_split_value(value2)

          post_at_list = converter.post_at_change_value(get_post_at)

          source_site_id = SourceSite.find_by(key: source_site_key).id

          # addressには何も設定しない
          address = ""

          # 配列の中にハッシュとして取得した要素を格納
          POST_COUNT.times.with_index do |i|
            post_data = { source_site_id: source_site_id,
                          url: url_list[i], title: title_list[i], sex: sex_list[i], name: name_list[i],
                          age: age_list[i], post_at: post_at_list[i], category: category_list[i],
                          prefecture: prefecture, city: city_list[i], address: address, from: ""
                        }
            @post_data_list[i] = post_data
          end

          logging_end(__method__)
        end

        def click_next
          @page_no = @page_no + 1
          selector = "ul.pageNavi > li:nth-child(#{@page_no}) > a"
          session.execute_script "$('#{selector}').trigger('click')"
        end
    end
  end
end
