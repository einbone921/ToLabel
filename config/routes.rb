Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  root to: 'homes#top'
  get '/about' => 'homes#about'
  resources :users, only: [:show, :edit, :update]
  resources :post_images, only: [:new, :show, :create, :index, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
end
