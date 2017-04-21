Rails.application.routes.draw do
  
  resources :messages
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get   '/recieve', to: 'messages#recieve'
  post '/save', to: 'messages#save'
  get '/getmessages', to: 'static#getmessages'
  post '/conversation', to: 'conversations#create'
  get  '/conversations',   to: 'conversation#index'
  
  resources :users
  root "static#home"
  
end
