Rails.application.routes.draw do
  get 'stats/show'
  devise_for :users
  resources :songs
  resources :api
  resources :stats
  root 'home#index'
  get "/api" => "api#index", via: [:get, :post]
end
