Rails.application.routes.draw do
  devise_for :users
  resources :songs
  resources :api
  root 'home#index'
end
