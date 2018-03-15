Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  resources :books, only: [:index, :show]
  get 'books/:id/rents', to: 'books#rents'

  resources :users do
    resources :rents, only: [:index, :create, :show, :destroy]
  end

  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
  root to: "home#index"
end
