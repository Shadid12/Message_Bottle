Rails.application.routes.draw do
  
  resources :messages
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get   '/recieve', to: 'messages#recieve'
  post '/save', to: 'messages#save'
  get '/getmessages', to: 'static#getmessages'
  post '/conversation', to: 'conversations#create'
  get  '/conversations',   to: 'conversations#index'
  get '/pms', to: 'conversations#pms'
  get  '/conversations/show',   to: 'conversations#show'
  # post a pm
  post '/pm', to: 'pms#create'
  
  resources :users
  root "static#home"
  
end
