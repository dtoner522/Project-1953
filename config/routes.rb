Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :books, only: [:new, :create]

  resources :libraries
  resources :library_books, only: [:index, :show]
  post 'library_books', to: 'library_books#create', as: 'create_library_book'
  delete 'library_books/:id', to: 'library_books#destroy', as: 'delete_library_book'

  resources :wishlists
  resources :wishlist_books, only: [:index, :show]
  post 'wishlist_books', to: 'wishlist_books#create', as: 'create_wishlist_book'
  delete 'wish_books/:id', to: 'wishlist_books#destroy', as: 'delete_wishlist_book'

  resources :chatrooms, only: [:show, :create] do
    resources :messages, only: :create
  end

  get 'uikit', to: 'pages#uikit'
  get 'messages', to: 'pages#messages'
  get 'notifications', to: 'pages#notifications'
  get 'chatrooms/:id/swap', to: 'swap_requests#mark_as_swapped', as: :swap
  get 'library_book/:id/swapped_book', to: 'library_books#mark_as_swapped', as: :swapped_book
  get 'error', to: 'pages#error'

  resources :users, only: [:show]

end
