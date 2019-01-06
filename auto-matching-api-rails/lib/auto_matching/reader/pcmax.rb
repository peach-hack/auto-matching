module AutoMatching
  module Reader
    class Pcmax < ReaderBase
      include Common::Pcmax
    end

    private
      def read_board
        # TODO

        @list = []

        @data = {}
        @data[:name] = hoge
        @data[:age] = 30

        @list.add(@data)

      end

      def save_board
        @list.each do | data |
          a = Post.new(name: data[:name], age: data[:age])
          a.save
        end
      end
  end
end
