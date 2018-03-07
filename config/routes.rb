Rails.application.routes.draw do
  get 'books/index'
  get 'books/:id', to: 'books#show'

  devise_for :users

  get 'users/:id/rents' => 'users#rents' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
  root to: "home#index"
end
