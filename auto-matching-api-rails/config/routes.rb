# frozen_string_literal: true

Rails.application.routes.draw do
  root "index.html"

  defaults format: :json do
    namespace :api do
      namespace :users do
        resources :source_sites, only: %i[index update], path: "source-sites"
      end
    end
  end
end
