Rails.application.routes.draw do
  get 'transact_app/home'
  get 'transact_app/help'
  get 'transact_app/about'
  root :to => "transact_app#home"
end
