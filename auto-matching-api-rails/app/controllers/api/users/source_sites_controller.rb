module Api
  module Users
    class SourceSitesController < ::ApplicationController
      def index
        source_sites = SourceSite.all
        render json: SourceSiteSerializer.new(source_sites).serialized_json
      end
    end
  end
end
