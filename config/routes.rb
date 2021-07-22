Rails.application.routes.draw do
  root to: 'posts#all'
  get '/profil', to:'users#update', as: :profil

  resources :users, only: [:new, :create ] do
    member do
      get 'confirm'
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts
end
