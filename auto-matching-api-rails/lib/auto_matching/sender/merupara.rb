module AutoMatching
  module Sender
    class Merupara < SenderBase
      include Common::Merupara

      private
        def delete_past_post
          session.visit("https://meru-para.com/ms/mb/MB.aspx?sid=&pf=7")


          session.click_link "③投稿一覧"
          session.first("#Bdel").click
        end

        def send_new_post
          session.visit("https://meru-para.com/ms/mb/Wr.aspx?sid=&cgid=1&m=ad1")

          session.fill_in "TBt", with: post[:title]
          session.fill_in "TBm", with: post[:body]

          submit { session.find("#Bw").native.send_keys :enter }
        end
    end
  end
end
