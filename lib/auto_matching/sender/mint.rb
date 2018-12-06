# frozen_string_literal: true

module AutoMatching
  module Sender
    class Mint < PostSenderBase
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

          sleep 3
        end

        def delete_past_post
        end

        def send_new_post
        end
    end
  end
end
