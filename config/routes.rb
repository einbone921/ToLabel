Rails.application.routes.draw do
  root to: 'homes#top'
  get '/about' => 'homes#about'
  get '/new_posts' => 'homes#new_posts'
  get '/popular' => 'homes#popular'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  devise_scope :user do
    post 'users/guest_sign_in' => 'users/sessions#new_guest'
  end

  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
    put :hide, on: :member
  end

  resources :post_images, only: [:new, :show, :create, :index, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  resources :inquiries, only: [:new, :create]

  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
  end

  namespace :admins do
    resources :users, only: [:index, :show, :edit, :update]
    resources :post_images, only: [:index, :show, :edit, :update]
  end
end
