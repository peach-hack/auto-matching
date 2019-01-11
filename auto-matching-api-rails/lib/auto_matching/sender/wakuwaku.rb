# frozen_string_literal: true

module AutoMatching
  module Sender
    class Wakuwaku < SenderBase
      include Common::Wakuwaku

      private
        def delete_past_post
          logging_start(__method__)

          session.visit("http://550909.com/m/bbs/history")
          session.has_text?("募集履歴")

          # すでに投稿がある場合は投稿を削除
          unless session.has_css?(".BtnToPureBBS")
            session.execute_script "document.post.all.value=1;document.post.submit();return false;"
            session.execute_script "document.post.submit();return false;"
          end

          logging_end(__method__)
        end

        def send_new_post
          logging_start(__method__)
          session.visit("http://550909.com/m/bbs/post/?menu=adult&genre=3")

          session.fill_in "title", with: post[:title]
          session.fill_in "body", with: post[:body]

          submit { session.execute_script "$('.js-btn--post').trigger('click')" }

          logging_end(__method__)
        end
    end
  end
end
