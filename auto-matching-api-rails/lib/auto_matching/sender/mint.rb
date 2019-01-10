module AutoMatching
  module Sender
    class Mint < SenderBase
      include Common::Mint

      private
        def delete_past_post
          logging_start(__method__)

          session.visit("https://mintj.com/ms/mb/MB.aspx?sid=&pf=7")
          session.click_link("③投稿一覧")
          session.first("#Bdel").click

          logging_end(__method__)
        end

        def send_new_post
          logging_start(__method__)

          session.visit("https://mintj.com/ms/mb/Wr.aspx?sid=&cgid=1&m=ad1")

          session.fill_in "TBt", with: post[:title]
          session.fill_in "TBm", with: post[:body]

          submit { session.find("#Bw").native.send_keys :enter }

          logging_end(__method__)
        end
    end
  end
end
