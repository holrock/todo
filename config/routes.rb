Rails.application.routes.draw do
  resources :todo_items

  get 'static_pages/top'
  root :to => 'static_pages#top'

  get 'todo' => 'todo_lists#list', :as => :todo

  resources :users
  resources :user_sessions

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
