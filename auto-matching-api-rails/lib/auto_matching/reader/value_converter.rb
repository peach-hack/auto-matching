module AutoMatching
  module Reader
    module ValueConverter
      def name_age_sex_change(value)
        @sex = []
        @name = []
        @age = []
        @post_at = []
        @from = []

        value.each_with_index do |v, i|
          t = v.split(" ")
          s, n, a = t
          sex_i = (s == "♀" ? 1 : 0)
  
          @sex.push(sex_i)
          @name.push(n)
          @age.push(a)
        end
        return @sex, @name, @age
      end
  
      def post_at_change(post_time)
        # 日付型に変更
        post_time.each do |date|
          @post_at.push(Time.strptime(date, "%Y年%m月%d日 %H:%M"))
        end
        @post_at
      end
  
      def from_change(post_from)
        rex = /(...??[都道府県])/
        rex2 = /(...??[都道府県])(...??[市区町村])/
        rex3 = /(...??[都道府県])((?:旭川|伊達|石狩|盛岡|奥州|田村|南相馬|那須塩原|東村山|武蔵村山|羽村|十日町|上越|富山|野々市|大町|蒲郡|四日市|姫路|大和郡山|廿日市|下松|岩国|田川|大村)市|.+?郡(?:玉村|大町|.+?)[町村]|.+?市.+?区|.+?[市区町村])(.+)/

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

          if args.match(rex3)
            @from.push(args.match(rex3).captures)
          elsif args.match(rex2)
            @from.push(args.match(rex2).captures)
          else
            @from.push(args.match(rex).captures)
          end
        end

        @from
      end
    end
  end
end

