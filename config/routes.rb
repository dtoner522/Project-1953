Rails.application.routes.draw do
  root to: 'pages#home'
    
  devise_for :users
  resources :users, only: [:show]

  resources :libraries do
    resources :library_books, except: [:index, :show]
  end

  resources :library_books, only: [:index, :show]

  resources :chatrooms, only: [:show, :create] do
    resources :messages, only: :create
  end

  get 'uikit', to: 'pages#uikit'
  
end
