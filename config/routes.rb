Rails.application.routes.draw do
  resources :users
  resources :songs
  root 'home#index'
end
