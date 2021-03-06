# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'users/new'
  resource :users
  root 'sessions#index'
  get 'sessions/new'

  post 'posts/new', to: 'posts#create'
  post 'sessions/new', to: 'sessions#create'
  
  delete 'logout', to: 'sessions#destroy'

  resources :posts, only: [:new, :create, :index]
  # post 'users/new', to: 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
