Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/help'
  get 'users/new'
  # post "users" => "users#create"


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :topics do
    resources :comments
  end

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'

  post '/topics/(:topic_id)/comments/new' => 'comments#new'
  post 'favorites/:topic_id/destroy' => 'favorites#destroy'

  get 'comments/new'
  post '/comments', to: 'comments#create'
end
