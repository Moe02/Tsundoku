Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :user_books, only: [:index, :show] do
    resources :users, only: [:show]
  # do
  #   resources :user_books, only: [:index, :show]
  # do
  #   resources :books, only: [:index, :show]
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
