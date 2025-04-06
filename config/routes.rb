Rails.application.routes.draw do
  resources :users
  resources :beers
  resources :breweries
  resources :ratings, only: [ :index, :new, :create, :destroy ]
  resource :session, only: [ :new, :create, :destroy ]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "kaikki_bisset", to: "beers#index"
  get "signup", to: "users#new"
  
  get "signin", to: "sessions#new"
  delete "signout", to: "sessions#destroy"
  
  get "up" => "rails/health#show", as: :rails_health_check
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "breweries#index"
end
