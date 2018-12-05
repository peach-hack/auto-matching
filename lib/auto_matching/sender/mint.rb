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
        end

        def delete_past_post
        end

        def send_new_post
        end
    end
  end
end
