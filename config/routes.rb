Rails.application.routes.draw do
  devise_for :users
  resources :products do
    resources :orders, only: :create
  end

  resources :orders, only: [:destroy] do
    patch 'remove_one_item'
    collection do
      get 'cart'
      delete 'empty_cart'
    end
  end

  root 'products#index'

end
