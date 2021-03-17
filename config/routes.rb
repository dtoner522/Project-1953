Rails.application.routes.draw do
  devise_for :users

  resources :libraries do
    resources :library_books, except: [:index, :show]
  end

  resources :library_books, only: [:index, :show]

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'uikit', to: 'pages#uikit'
end
