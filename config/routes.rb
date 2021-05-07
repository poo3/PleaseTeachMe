Rails
  .application
  .routes
  .draw do
    namespace :api do
      resources :users
      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
      post '/auth_conf', to: 'sessions#auth_conf'
    end
    root 'page#index'
    get '*path', to: 'page#index'
    # resources :contact
    # resources :questions, only: [:show,:new,:create, :destroy]
  end
