module AutoMatching
  module Common
    module DriverBase
      def source_site_key
        raise NotImprementedError
      end

      def try_login
        raise NotImprementedError
      end

      def source_site
        @source_site ||= SourceSite.find_by(key: self.source_site_key)
      end

      def user_id
        source_site.user_id
      end

      def password
        source_site.password
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
