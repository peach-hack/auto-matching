module AutoMatching
  class Base
    attr_reader :token

    def initialize(*_args)
      capybara_setting
    end

    def run
      # set_cookie

      run_process

      # save_cookie
    rescue StandardError => e
      save_current_page if Rails.env.development?
      logger.error("#{e.message}")
      raise e
    end

    private

      def driver_name
        :headless_chrome
      end

      def capybara_setting
        Capybara.register_driver :headless_chrome do |app|
          Capybara::Selenium::Driver.new(
            app,
            browser: :chrome,
            desired_capabilities: capabilities
          )
        end
        Capybara.default_selector = :css
        Capybara.ignore_hidden_elements = false
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
            args: %w[headless disable-gpu window-size=375,667 no-sandbox disable-dev-shm-usage],
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
        Rails.root.join("tmp", "capybara", "#{ts}_#{source_site_key}_screenshot.png")
      end

      def html_name
        Rails.root.join("tmp", "capybara", "#{ts}_#{source_site_key}_page.html")
      end

      def ts
        @ts ||= Time.zone.now.strftime("%Y%m%d%H%M%S")
      end

      def logging_start(method_name)
        logger.info("#{logging_format(method_name)} start")
      end

      def logging_end(method_name)
        logger.info("#{logging_format(method_name)} end")
      end

      def logging_format(method_name)
        "#{module_type}:#{source_site_key}:#{method_name}"
      end

      def logger
        @logger ||= MultiLogger.logger
      end

      def cookie_file_name
        Rails.root.join("tmp", "cookie", "#{source_site_key}_cookie.json")
      end

      def load_cookie
        return unless File.exist?(cookie_file_name)
        File.open(cookie_file_name) do |f|
          return JSON.parse(f.read, symbolize_names: true)
        end
      end

      def set_cookie
        tmp_cookie = load_cookie
        return if tmp_cookie.blank?
        session.visit(host)
        tmp_cookie.each do |cookie|
          session.driver.browser.manage.add_cookie(name: cookie[:name], value: cookie[:value], path: cookie[:path])
        end
      end

      def get_coolies
        session.driver.browser.manage.all_cookies
      end

      def get_cookie(key)
        cookies = session.driver.browser.manage.all_cookies
        cookie = cookies.find { |c| c[:name] == key }
        cookie && cookie[:value]
      end

      def save_cookie
        tmp_cookies = session.driver.browser.manage.all_cookies
        File.open(cookie_file_name, "w") do |f|
          JSON.dump(tmp_cookies, f)
        end
      end
  end
end
