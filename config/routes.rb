Rails.application.routes.draw do
  resources :todo_lists
  resources :todo_items
  get 'static_pages/top'
  root :to => 'static_pages#top'

  resources :users
  resources :user_sessions
  resources :users

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
