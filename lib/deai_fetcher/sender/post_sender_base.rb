# frozen_string_literal: true

module AutoMatching
  module Sender
    class PostSenderBase < Base
      attr_reader :post

      def initialize(post: nil)
        @post = post if post.present?
        super
      end

      def run
        run_process
      rescue StandardError => e
        raise e
      end

      def run_process
        raise NotImprementedError
      end

      private

        def source_site
          SourceSite.find_by(key: self.class.source_site_key)
        end

        def source_site_key
          raise NotImprementedError
        end

        def login_user
          source_site.login_user
        end

        def login_password
          source_site.login_password
        end

        def url
          source_site.url
        end

        def host
          url.split(URI.parse(url).path).first.to_s
        end

        def cookie_file_name
          Rails.root.join("tmp", "#{self.class.source_site_key}_cookie.json")
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

        def save_cookie
          tmp_cookies = session.driver.browser.manage.all_cookies
          File.open(cookie_file_name, "w") do |f|
            JSON.dump(tmp_cookies, f)
          end
        end
    end
  end
end
