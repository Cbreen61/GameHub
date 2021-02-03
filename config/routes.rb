Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root(to: "static#home")

  resources :games do 
    resources :ratings
  end

  resources :platforms, only [:show,:create]
  resources :users, only: [:new,:create]
end
