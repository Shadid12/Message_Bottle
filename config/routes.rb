Rails.application.routes.draw do
  resources :users
  root "static#home"
end
