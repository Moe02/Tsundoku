Rails.application.routes.draw do
  get 'requests/index'#, to: 'requests#index'
  devise_for :users
  root to: 'pages#home'

  get 'user_books/:id/bookshelf', to: 'user_books#bookshelf', as: 'bookshelf'
  get '/dashboard', to: 'users#dashboard', as: 'dashboard'

  resources :user_books, only: [:index, :show] do
    resources :requests, only: [:create]
  end
  resources :requests, only: [:update]
  # do
  #   resources :user_books, only: [:index, :show]
  # do
  #   resources :books, only: [:index, :show]
  # end

end
