Rails.application.routes.draw do
  match "*path" => "options_request#preflight", via: :options

  defaults format: :json do
    namespace :api do
      namespace :users do
        namespace :posts do
          resources :templates, only: %i[index update create destroy]
        end
        resources :source_sites, only: %i[index update], path: "source-sites"
      end
    end
  end
end
