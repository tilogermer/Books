Rails.application.routes.draw do
  
  root 'about#index'

  devise_for :users
    
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
  resources :tags
  
  resources :statistics, only:[] do
    collection do
      get 'authors_by_country'
    end
  end
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
