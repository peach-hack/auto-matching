module AutoMatching
  module Sender
    class Happymail < SenderBase
      include Common::Happymail

      private
        def delete_past_post
          session.visit("https://happymail.co.jp/sp/app/html/keijiban_write_log.php")

          session.execute_script "$('.ds_link_tab_item').not('ds_link_tab_item_is_active').trigger('click')"
          session.execute_script "$('.icon-header_trush').trigger('click')"
          session.execute_script "$('.ds_js_check_box_input').trigger('click')"
          session.execute_script "$('#button-delete').trigger('click')"
          session.execute_script "$('.modal-confirm').trigger('click', '[data-remodal-action=\"confirm\"]')"
        end

        def send_new_post
          session.visit("https://happymail.co.jp/app/html/keijiban_write.php")

          session.execute_script "$('.ds_link_tab_item').not('ds_link_tab_item_is_active').trigger('click')"

          session.fill_in "Subj", with: post[:title]
          session.fill_in "Body", with: post[:body]

          unless ENV["DEBUG"]
            session.execute_script "$('.input__form__action__button__send').trigger('click', '[data-remodal-target]')"
          end
        end
    end
  end
end
