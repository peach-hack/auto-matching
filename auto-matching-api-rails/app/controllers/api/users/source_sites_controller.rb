module Api
  module Users
    class SourceSitesController < ::ApplicationController
      def index
        @source_sites = SourceSite.all
        render json: @source_sites
      end
    end
  end
end
