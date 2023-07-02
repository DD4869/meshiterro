Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/homes/about' => 'homes#about', as: 'about'

  # 投稿画像にコメントのため、post_commentsはpost_imagesに結びつく
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy] #resourceとなっている。単数形にすると/:idがURLに含まれなくなります
    resources :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
