Rails.application.routes.draw do
  resources :users, except: :create
  resources :comments, only: :create
  resources :posts

  post 'signup', to: 'users#create', defaults: {format: :json}
  post 'login', to: 'users#create_session', defaults: {format: :json}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
