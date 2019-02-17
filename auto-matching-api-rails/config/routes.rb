require "sidekiq/web" if Rails.env.development?
require "logster" if Rails.env.development?

Rails.application.routes.draw do
  match "*path" => "options_request#preflight", via: :options

  mount Sidekiq::Web, at: "/sidekiq" if Rails.env.development?
  mount Logster::Web, at: "/logs" if Rails.env.development?
  mount ActionCable.server => "/cable"

  defaults format: :json do
    namespace :api do
      resources :users, only: [:create]
      resource :session, only: [:create, :destroy]

      namespace :users do
        namespace :posts do
          resources :templates, only: %i[index update create destroy]
          resources :manual_posts, only: %i[index], path: "manual-posts"
          post :manual_posts, to: "manual_posts#execute", path: "manual-posts"
          post :daily_crawl, to: "daily_crawl#execute", path: "daily-crawl"
        end

        resources :search, only: %i[index] do
          post :db, on: :collection
          post :keyword, on: :collection
          post :realtime, on: :collection
          post :result, on: :collection
        end

        namespace :settings do
          resources :source_sites, only: %i[index update], path: "sites"
          resources :posts, only: %i[index] do
            post :clear, on: :collection
          end
        end

        namespace :auto do
          post :slack, to: "slack#execute"
          resource :scheduler, only: %i[index edit]
      end
    end
  end
end
