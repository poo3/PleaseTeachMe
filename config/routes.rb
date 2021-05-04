Rails
  .application
  .routes
  .draw do
    # get 'page/index'
    root 'page#index'
    get '*path', to: 'page#index'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    resources :users

    # resources :contact
    # resources :questions, only: [:show,:new,:create, :destroy]
  end
