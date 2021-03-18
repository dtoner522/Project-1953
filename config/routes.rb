Rails.application.routes.draw do
  devise_for :users

  resources :books, only: [:new, :create]
  resources :libraries
  resources :library_books, only: [:index, :show]
  post 'library_books', to: 'library_books#create', as: 'create_library_book'

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'uikit', to: 'pages#uikit'

  get 'results', to: 'pages#results'


  resources :users, only: [:show]
end
