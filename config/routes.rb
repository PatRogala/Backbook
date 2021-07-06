Rails.application.routes.draw do
  root to: 'users#index'

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    member do
      post 'invite', as: 'invite'
      post 'accept', as: 'accept'
      delete 'decline', as: 'decline'
    end
  end
  get "/profile", to: "users#profile", as: "profile"
  get "/notification", to: "users#notification", as: "notification"
end
