Rails.application.routes.draw do
  # get 'page/index'
  root 'page#index'
  get 'sessions/new', to: 'page#index'
  get 'users/new',as: 'signup', to: 'page#index'
  get '/help', to: 'page#index'
  get '/contact', to: 'page#index'
  get '/login', to: 'page#index'
  # post '/login', to: 'page#index'
  # delete '/logout', to: 'page#index'
  # resources :users

  # resources :contact
  # resources :questions, only: [:show,:new,:create, :destroy]
end
