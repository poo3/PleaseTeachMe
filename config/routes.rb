Rails.application.routes.draw do
  root 'static_pages#home'
  get 'sessions/new'
  get 'users/new',as: 'signup'
  get 'static_pages/help'
  get 'static_pages/contact'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users

  resources :contact
  resources :questions, only: [:show,:new,:create, :destroy]
end
