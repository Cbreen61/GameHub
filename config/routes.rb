Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root(to: "static#home")

  resources :games do 
    resources :reviews
  end

  resources :platforms
  resources :users, only: [:new,:create]
  
  get "/logout", to: "sessions#logout", as: "logout"
  get "/signup", to: "sessions#signup", as: "signup"
  post "/signup", to: "sessions#create"

  match '/auth/:google_oauth2/callback' => 'sessions#google', via: [:get,:post]
end
