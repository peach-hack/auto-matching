module Api
  module Users
    class SourceSitesController < ::ApplicationController
      def index
        source_sites = SourceSite.all
        render json: SourceSiteSerializer.new(source_sites).serialized_json
      end

      def update
        logger.debug(params)
        source_site = SourceSite.find_by(key: params[:key])
        source_site.update_attributes(
          login_user: params[:login_user],
          login_password: params[:login_password],
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
