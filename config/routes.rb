Rails.application.routes.draw do
  
  root 'static#home'

  resources :users


  get "/auth/github/callback", to: "sessions#omniauth"
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
end
