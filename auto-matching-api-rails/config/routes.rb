require "sidekiq/web"
require "logster"

Rails.application.routes.draw do
  match "*path" => "options_request#preflight", via: :options
  mount Sidekiq::Web, at: "/sidekiq"
  mount Logster::Web, at: "/logs"
  mount ActionCable.server => "/cable"

  defaults format: :json do
    namespace :api do
      namespace :users do
        namespace :posts do
          resources :templates, only: %i[index update create destroy]
          resources :manual_posts, only: %i[index], path: "manual-posts"
          post :manual_posts, to: "manual_posts#execute", path: "manual-posts"
        end
        namespace :search do
          resources :posts, only: %i[index]
        end
        resources :source_sites, only: %i[index update], path: "source-sites"
      end
    end
  end
end
