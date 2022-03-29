Rails.application.routes.draw do
  devise_for :users
  root to:"communities#index"
  resources :communities, only: :index do
    resources :posts, only: [:index, :new, :create, :destroy] 
  end
  resources :posts, only: [:index, :new, :create,:destroy, :show] do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
end
