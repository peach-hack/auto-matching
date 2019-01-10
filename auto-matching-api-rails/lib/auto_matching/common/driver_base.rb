module AutoMatching
  module Common
    module DriverBase
      def module_type
        raise NotImprementedError
      end

      def source_site_key
        raise NotImprementedError
      end

      def try_login
        raise NotImprementedError
      end

      def source_site
        @source_site ||= SourceSite.find_by(key: self.source_site_key)
      end

      def login_user
        source_site.login_user
      end

      def login_password
        source_site.login_password
      end

      def url
        source_site.login_url
      end

      def host
        url.split(URI.parse(url).path).first.to_s
      end
    end
  end
end
