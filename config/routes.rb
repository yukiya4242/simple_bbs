Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :users
  resources :posts do
    resources :comments, only: [:create]
  end

  root 'posts#index'
end
