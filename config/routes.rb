Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  resources :users, only: [:show]

  resources :books, only: [:new, :create]
  resources :libraries
  resources :library_books, only: [:index, :show]
  post 'library_books', to: 'library_books#create', as: 'create_library_book'

  delete 'library_books/:id', to: 'library_books#destroy', as: 'delete_library_book'

  resources :chatrooms, only: [:show, :create] do
    resources :messages, only: :create
  end

  get 'uikit', to: 'pages#uikit'
  get 'notifications', to: 'pages#notifications'

  resources :users, only: [:show]
end
