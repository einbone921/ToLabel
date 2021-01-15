Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  devise_scope :user do
    post 'users/guest_sign_in' => 'users/sessions#new_guest'
  end

  root to: 'homes#top'
  get '/about' => 'homes#about'
  get '/new_posts' => 'homes#new_posts'

  # userにネスト
  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  # post_imageにネスト
  resources :post_images, only: [:new, :show, :create, :index, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
end
