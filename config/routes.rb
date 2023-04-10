Rails.application.routes.draw do
  get 'messages/index'
  get 'messages/create'
  get 'users/show'
  devise_for :users
  resources :users
  resources :posts do
    resources :comments, only: [:create]
  end

  root 'posts#index'
end
