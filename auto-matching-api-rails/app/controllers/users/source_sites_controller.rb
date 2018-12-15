module Users
  class SourceSitesController < ::Users::ApplicationController
    def index
      @source_sites = SourceSite.all
    end
  end
end
