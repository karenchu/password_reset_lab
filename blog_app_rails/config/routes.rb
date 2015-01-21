Rails.application.routes.draw do

  # get "sites/index"
  get "sites/contact"
  get "sites/about"

  # get 'sessions/new'
  # get 'users/index'
  # get 'users/show'
  # get 'users/new'
  # get 'users/edit'

  resources :users

  get "/sign_up", to: "users#new"
  resources :sessions, only: [:create, :destroy]

  get "/login", to: "sessions#new", as: "login"

  get "passwords/new", to: "passwords#new", as: "new_password"
  get "passwords/:id/edit", to: "passwords#edit", as: "edit_password"
  post "/passwords", to: "passwords#create" 
  post "/passwords/:id", to: "passwords#update"

  # get "/articles", to: "articles#index", as: "articles"
  # get "/articles/new", to: "articles#new", as: "new_article"
  # get "/articles/:id", to: "articles#show", as: "article"
  # get "/articles/:id/edit", to: "articles#edit", as: "edit_article"
  # post "/articles", to: "articles#create", to: "articles#create"
  # patch "/articles/:id", to: "articles#update"
  # delete "/articles/:id", to: "articles#destroy"
  root to: "articles#index"
  resources :articles
end
