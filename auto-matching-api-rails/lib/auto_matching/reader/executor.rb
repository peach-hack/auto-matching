module AutoMatching
  module Reader
    class Executor
      def run(klass, area_list, genre_list)
        area_list = ["東京都", "神奈川県"] if area_list.nil?
        genre_list = ["スグ会いたい"] if genre_list.nil?

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
