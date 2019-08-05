Rails.application.routes.draw do
  get 'users/new'
  get 'posts/new'
  post '/posts/new', to: "posts#create"
  get 'posts/index'
  root 'sessions#index'
  get 'sessions/new'
  post 'sessions/new' , to: "sessions#create"
  delete 'logout', to: 'sessions#destroy'
  post 'users/new', to: 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
