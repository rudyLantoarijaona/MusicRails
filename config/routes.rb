Rails.application.routes.draw do
  devise_for :users
  resources :songs
  resources :api
  root 'home#index'
  get "/api" => "api#index", via: [:get, :post]
end
