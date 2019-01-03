module Api
  module Users
    module Posts
      class TemplatesController < ::ApplicationController
        def index
          templates = PostTemplate.all
          render json: PostTemplateSerializer.new(templates).serialized_json
        end
      end
    end
  end
end
