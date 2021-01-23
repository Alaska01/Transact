Rails.application.routes.draw do
  get 'users/new'
  get 'transact_app/home'
  get 'transact_app/help'
  get 'transact_app/about'
  root :to => "transact_app#home"
  get '/signup', to: 'users#new'
end
