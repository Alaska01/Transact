Rails.application.routes.draw do
  
  root 'transact_app#home'
  get '/', to:'transact_app#home'
  
  get '/profile', to: 'transact_app#profile'
  get 'transact_app/about'
  
  get '/signup', to: 'users#new'
  get '/login', to:       'sessions#new'
  post '/login', to:      'sessions#create'
  delete '/logout', to:   'sessions#destroy'
 
  resources :users

  resources   :groups, only: [:index, :new, :create, :show]

  resources   :logs, only: [:index, :individual, :new, :create]
  get         '/individual',    to:   'logs#individual'
  get         '/excluding',    to:   'logs#excluding'
end
