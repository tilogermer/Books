Rails.application.routes.draw do
  get 'reviews/index'

  get 'reviews/new'

  get 'reviews/create'

  get 'reviews/edit'

  get 'reviews/show'

  get 'reviews/update'

  get 'reviews/destroy'

  devise_for :users
  get 'media/index'

  get 'media/new'

  get 'media/create'

  get 'media/show'

  get 'media/edit'

  get 'media/udpate'

  get 'media/destroy'

  get 'categories/index'

  get 'categories/new'

  get 'categories/create'

  get 'categories/show'

  get 'categories/edit'

  get 'categories/update'

  get 'categories/destroy'

  get 'countries/index'

  get 'countries/new'

  get 'countries/create'

  get 'countries/show'

  get 'countries/edit'

  get 'countries/update'

  get 'countries/destroy'

  get 'authors/index'

  get 'authors/new'

  get 'authors/create'

  get 'authors/show'

  get 'authors/edit'

  get 'authors/update'

  get 'authors/destroy'

  get 'libraries/index'

  get 'libraries/new'

  get 'libraries/create'

  get 'libraries/show'

  get 'libraries/edit'

  get 'libraries/update'

  get 'libraries/destroy'

  get 'books/index'

  get 'books/new'

  get 'books/create'

  get 'books/show'

  get 'books/edit'

  get 'books/update'

  get 'books/destroy'

  get 'about/index'
  get 'about' => 'about#index'

  get 'books/booklist' => 'books#booklist'

  resources :books do
    resources :reviews
  end
  
  resources :categories
  resources :authors
  resources :libraries
  resources :media
  resources :authors
  resources :countries
  

  root 'about#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
