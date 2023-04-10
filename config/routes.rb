Rails.application.routes.draw do

  devise_for :users


  resources :posts, only: [:new, :create, :show, :destroy]

  resources :users, only: [:show] do
  resources :messages, only: [:index, :create]
  end

  resources :posts do
  resources :comments, only: [:create]
  end

  root 'posts#index'
end
