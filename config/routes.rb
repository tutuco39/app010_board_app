Rails.application.routes.draw do
  devise_for :users
  root "topics#index"

  resources :topics do
    resources :comments, only: [:create, :destroy]
    resource  :like,     only: [:create, :destroy]          # Topic用
  end

  resources :comments, only: [] do
    resource :like, controller: "comment_likes", only: [:create, :destroy]  # Comment用
  end



end

