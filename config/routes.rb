Rails.application.routes.draw do
  devise_for :users
  root "topics#index"

  resources :topics do
    resources :comments, only: [:create, :destroy]
    resource  :like,     only: [:create, :destroy]
  end

end

