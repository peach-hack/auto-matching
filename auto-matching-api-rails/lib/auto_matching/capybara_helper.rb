module AutoMatching
  module CapybaraHelper
    def click_selector(selector)
      session.first(selector).click
      # session.execute_script "document.querySelector('#{selector}').click();"
    end
  end
end
