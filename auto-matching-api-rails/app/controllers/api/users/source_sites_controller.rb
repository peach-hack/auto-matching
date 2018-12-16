module Api
  module Users
    class SourceSitesController < ::ApplicationController
      def index
        @source_sites = SourceSite.all
      end
    end
  end
end
