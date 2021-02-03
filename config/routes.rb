Rails.application.routes.draw do
  
  root 'transact_app#home'
  get 'users/new'
  get 'transact_app/home'
  get 'transact_app/help'
  get 'transact_app/about'
  
  get '/signup', to: 'users#new'
  get '/login', to:       'sessions#new'
  post '/login', to:      'sessions#create'
  delete '/logout', to:   'sessions#destroy'
 
  resources :users

  resources   :groups, only: [:index, :new, :create, :show]

  resources   :transactions, only: [:index, :individual, :new, :create]
  get         '/individual',    to:   'transactions#individual'
end
