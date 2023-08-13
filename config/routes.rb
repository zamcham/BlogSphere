Rails.application.routes.draw do
  get 'comments/index'
  get 'comments/show'
  get 'comments/edit'
  get 'comments/new'
  get 'likes/index'
  get 'likes/show'
  get 'likes/new'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
  get 'posts/index'
  get 'posts/show'
  get 'posts/new'
  get 'posts/edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
