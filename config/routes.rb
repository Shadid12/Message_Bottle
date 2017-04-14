Rails.application.routes.draw do
  resources :users
  root "static#home"
  resources :users, only: [:create]
end
