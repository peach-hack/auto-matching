module AutoMatching
  module Reader
    class Executor
      DEFAULT_AREA_LIST = ["東京都", "神奈川県"]
      DEFAULT_GENRE_LIST = ["スグ会いたい"]

      def run(klass, area_list = nil, genre_list = nil)
        area_list = DEFAULT_AREA_LIST if area_list.nil?
        genre_list = DEFAULT_GENRE_LIST if genre_list.nil?

        area_list.product(genre_list) do | area, genre |
          puts "Execute Reader ---> area: #{area} genre: #{genre}"

          runner = klass.new
          runner.area = area
          runner.genre = genre
          runner.run
        end
      end
    end
  end
end
