Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, only: [:index, :show, :new, :create, :destroy] do
    resources :bookmarks, only: [:new, :create, :index, :show]
    resources :reviews, only: [:new, :create, :index, :show]
  end
  resources :bookmarks, only: :destroy
  resources :reviews, only: :destroy
end
