Rails.application.routes.draw do
  
  get 'technologies/index'

  devise_for :users
    
  get 'about/index'
  get 'about' => 'about#index'

  get 'books/booklist' => 'books#booklist'
  get 'books/new_books' => 'books#new_books'
  get 'statistics' => 'statistics#index'
  get 'technologies' => 'technologies#index'
  resources :books do
    resources :reviews
  end
  
  resources :categories
  resources :authors
  resources :libraries
  resources :media
  resources :authors
  resources :countries
  resources :readers
  
  
  root 'about#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
