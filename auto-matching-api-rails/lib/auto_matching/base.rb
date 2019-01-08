module AutoMatching
  class Base
    attr_reader :token

    def initialize(*_args)
      capybara_setting
    end

    def run
      run_process
    rescue StandardError => e
      save_current_page
      raise e
    end

    private

      def driver_name
        :headless_chrome
      end

      def capybara_setting
        Capybara.register_driver :headless_chrome do |app|
          driver = Capybara::Selenium::Driver.new(
            app,
            browser: :chrome,
            desired_capabilities: capabilities
          )
        end
        Capybara.default_selector = :css
        Capybara.configure do |config|
          config.default_max_wait_time = 10
          config.default_driver = :headless_chrome
          config.javascript_driver = :selenium
        end
      end

      def device_name
        "iPhone 6/7/8".freeze
      end

      def chrome_options
        mobile_emulation = { deviceName: device_name }
        if ENV["DEBUG"]
          {
            args: %w[disable-gpu window-size=375,667 no-sandbox],
            mobileEmulation: mobile_emulation
          }
        else
          {
            args: %w[headless disable-gpu window-size=375,667 no-sandbox],
            mobileEmulation: mobile_emulation
          }
        end
      end

      def capabilities
        Selenium::WebDriver::Remote::Capabilities.chrome(chrome_options: chrome_options)
      end

      def session
        @session ||= Capybara::Session.new(driver_name)
      end

      def save_current_page
        session.save_screenshot(screenshot_name)
        session.save_page(html_name)
      end

      def screenshot_name
        Rails.root.join("tmp", "capybara", "#{ts}_screenshot.png")
      end

      def html_name
        Rails.root.join("tmp", "capybara", "#{ts}_page.html")
      end

      def ts
        @ts ||= Time.zone.now.strftime("%Y%m%d%H%M%S")
      end
  end
end
