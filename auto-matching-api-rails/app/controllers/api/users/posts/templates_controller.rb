module Api
  module Users
    module Posts
      class TemplatesController < ::ApplicationController
        def index
          templates = PostTemplate.all
          render json: PostTemplateSerializer.new(templates).serialized_json
        end

        def create
          template = PostTemplate.new(title: params[:title], body: params[:body])

          if template.save
            response_success(:template, :create)
          else
            response_bad_request
          end
        end

        def update
          template = PostTemplate.find(params[:id])
          template.update_attributes(
            title: params[:title],
            body: params[:body])

          if template.save
            response_success(:template, :update)
          else
            response_bad_request
          end
        end

        private

          def template_params(params)
            params.require(:post_template).permit(:title, :body)
          end
      end
    end
  end
end
