module AutoMatching
  module Reader
    class Pcmax < ReaderBase
      include Common::Pcmax

      private
        def read_board
          session.visit("https://pcmax.jp/mobile/bbs_reference.php")

          session.execute_script "$('input.location_checkbox:checked').click()"
          session.execute_script "$('input#bbs_category9').click()"

          session.execute_script "$('body > form > div > div:nth-child(5) > label > select > option').attr('selected', false)"
          session.execute_script "$('body > form > div > div:nth-child(5) > label > select > option:selected').attr('selected', false)"
          session.execute_script "$('body > form > div > div:nth-child(5) > label > select > option:nth-child(17)').attr('selected', true)"

          session.execute_script "$('button.btn.moji_bold').click()"
        end
    end
  end
end
