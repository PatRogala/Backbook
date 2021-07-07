Rails.application.routes.draw do
  root to: 'posts#index'

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do
    member do
      post 'invite', as: 'invite'
      post 'accept', as: 'accept'
      delete 'decline', as: 'decline'
    end
  end
  get "/profile", to: "users#profile", as: "profile"
  get "/notification", to: "users#notification", as: "notification"
  resources :posts, only: [:create, :show] do
    member do
      get 'like', as: 'like'
      post 'comment', as: 'comment'
    end
  end
end
