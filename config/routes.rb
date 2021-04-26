Rails.application.routes.draw do
  # get 'page/index'
  root 'page#index'
  get 'sessions/new', to: 'page#index'
  get 'users/new',as: 'signup', to: 'page#index'
  get '/help', to: 'page#index'
  get '/contact', to: 'page#index'
  get '/login', to: 'page#index'
  get '/entrance', to: 'page#index'
  get '/register', to: 'page#index'
  get '/students/new', to: 'page#index'
  get '/students/:id', to: 'page#index'
  get '/students/login',to: 'page#index'
  get '/teachers/new', to: 'page#index'
  get '/teachers/:id', to: 'page#index'
  get '/teachers/login', to: 'page#index'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users

  # resources :contact
  # resources :questions, only: [:show,:new,:create, :destroy]
end
