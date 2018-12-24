module AutoMatching
  module Sender
    class Mint < SenderBase
      class << self
        def source_site_key
          SourceSite::KEY_MINT
        end
      end

      private

        def try_login
          session.fill_in "loginid", with: login_user
          session.fill_in "pwd", with: login_password
          session.find("#B1login").click
        end

        def delete_past_post
          session.visit("https://mintj.com/ms/mb/MB.aspx?sid=&pf=7")
          session.click_link("③投稿一覧")
          session.first("#Bdel").click
        end

        def send_new_post
          session.visit("https://mintj.com/ms/mb/Wr.aspx?sid=&cgid=1&m=ad1")

          session.fill_in "TBt", with: post[:title]
          session.fill_in "TBm", with: post[:body]

          unless ENV["DEBUG"]
            session.find("#Bw").native.send_keys :enter
          end
        end
    end
  end
end
