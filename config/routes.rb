Rails.application.routes.draw do
  root 'users#index'

  resources :users do
    resources :posts
      resources :comments, only: [:create]
  end
end
