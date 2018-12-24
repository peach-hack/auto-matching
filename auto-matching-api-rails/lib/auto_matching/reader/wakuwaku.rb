module AutoMatching
  module Reader
    class Wakuwaku < ReaderBase
      include Common::Wakuwaku

      class << self
        source_site_key
      end

      def read_board
        # TODO
      end
    end
  end
end
