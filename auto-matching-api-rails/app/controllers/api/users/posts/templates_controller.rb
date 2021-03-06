module Api
  module Users
    module Posts
      class TemplatesController < ::ApplicationController
        before_action :authenticate_user unless Rails.env.test?

        def index
          templates = PostTemplate.all
          render json: PostTemplateSerializer.new(templates).serialized_json
        end

        def create
          template = PostTemplate.new(title: params[:title], body: params[:body])

          if template.save
            response_success(:template, :create)
          else
            response_internal_server_error
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
            response_internal_server_error
          end
        end

        def destroy
          template = PostTemplate.find(params[:id])
          if template.destroy
            response_success(:template, :destroy)
          else
            response_internal_server_error
          end
        end
      end
    end
  end
end
