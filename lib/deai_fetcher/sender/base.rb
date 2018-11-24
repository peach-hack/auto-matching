module DeaiFetcher
  module Sender
    class Base
      attr_reader :token
      def initialize(*_args)
        @token = SecureRandom.hex(16)
        capybara_setting
      end

      def run
        raise NotImprementedError, "継承先で定義すること"
      end

      private

      def dirver_name
        :headless_chrome
      end

      def capybara_setting
        Capybara.register_driver :headless_chrome do |app|
          driver = Capybara::Selenium::Driver.new(
            app,
            browser: :chrome,
            desired_capabilities: capabilities
          )
          bridge_setting(driver)
        end
        Capybara.default_selector = :css
        Capybara.configure do |config|
          config.default_max_wait_time = 10
          config.default_driver = :headless_chrome
          config.javascript_driver = :selenium
        end
      end

      def bridge_setting(driver)
        bridge = driver.browser.send(:bridge)
        path = "session/#{bridge.session_id}/chromium/send_command"
        bridge.http.call(:post, path, cmd: "Page.setDownloadBehavior",
                                      params: {
                                        behavior: "allow",
                                        downloadPath: download_dir
                                      })
        driver
      end

      def chrome_options
        if ENV["DEBUG"]
          {
            args: %w[disable-gpu window-size=1920,1200]
          }
        else
          {
            args: %w[headless disable-gpu window-size=1920,1200]
          }
        end
      end

      def capabilities
        Selenium::WebDriver::Remote::Capabilities.chrome(chrome_options: chrome_options)
      end

      def session
        @session ||= Capybara::Session.new(dirver_name)
      end

      def download_dir
        Rails.root.join("tmp", token).to_s
      end

      def delete_download_dir
        FileUtils.rm_rf(download_dir)
      end

      def save_current_page_screenshot
        tmp_screenshot_name = screenshot_name
        session.save_screenshot(tmp_screenshot_name)
        tmp_screenshot_name
      end

      def screenshot_name
        Rails.root.join("tmp", "screenshot_#{Time.now.to_i}.png")
      end

      def ts
        @ts ||= Time.zone.now.strftime("%Y%m%d%H%M%S")
      end
    end
  end
end
