# frozen_string_literal: true

Rails.application.routes.draw do
  defaults format: :json do
    namespace :users do
      resources :source_sites, only: %i[index], path: "source-sites"
    end
  end
end
