module Api
  module Users
    module Serach
      class PostsController < ::ApplicationController
        def index
          q = Post.ransack(params[:q])
          post = q.result(distinct: trun).recent
        end
      end
    end
  end
end
