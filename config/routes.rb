Rails.application.routes.draw do
  get 'users/new'
  get 'posts/new'
  get 'posts/index'
  root 'sessions#index'
  get 'sessions/new'
  post 'sessions/create'
  delete 'sessions/delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
