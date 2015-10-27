Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  get '/sandra', to: 'visitors#sandra'

  get '/statistics', to: 'visitors#statistics'
end
