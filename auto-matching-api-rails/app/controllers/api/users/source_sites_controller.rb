module Api
  module Users
    class SourceSitesController < ::ApplicationController
      def index
        source_sites = SourceSite.all
        render json: SourceSiteSerializer.new(source_sites).serialized_json
      end

      def update
        source_site = SourceSite.find(params[:id])
        source_site.update_attributes(
          user_id: params[:user_id],
          password: params[:password],
          activate_flag: params[:activate_flag])

        if source_site.save
          response_success(:source_site, :update)
        else
          response_bad_request
        end
      end
    end
  end
end
