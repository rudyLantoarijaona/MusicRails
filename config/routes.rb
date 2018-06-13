Rails.application.routes.draw do
  resources :users
  resources :songs
  resources :api
  root 'home#index'
  get "/api" => "api#index", via: [:get, :post]
end
