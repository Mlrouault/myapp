Rails.application.routes.draw do
  root 'clients#home'
  get '/signup', to: 'users#new'
  resources :users
  resources :clients
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  delete '/logout',  to: 'sessions#destroy'
  get    '/shop',   to: 'clients#new'
  post    '/shop',   to: 'clients#new'
  get    '/cart',   to: 'clients#index'
end