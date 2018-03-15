require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'books/index'
  get 'books/:id', to: 'books#show'

  devise_for :users
  resources :books

  resources :users do
    resources :rents, only: [:index, :create, :show, :destroy]
  end
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
   mount_devise_token_auth_for 'User', at: 'auth'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
