module AutoMatching
  module Reader
    class Pcmax < ReaderBase
      include Common::Pcmax

      private
        def read_board
          sleep 3

          session.visit("https://pcmax.jp/mobile/bbs_reference.php")

          session.click_link "今からあそぼ"

          sleep 1
        end
    end
  end
end
