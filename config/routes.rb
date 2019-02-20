Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :users
  resources :products do
    resources :orders, only: :create
    resources :wishlists, only: :create
  end

  resources :wishlists, only: :index

  resources :orders, only: [:destroy] do
    patch 'remove_one_item'
    collection do
      get 'cart'
      delete 'empty_cart'
      post 'buy'
    end
  end

  resources :billings, only: [] do
    collection do
      post 'pre_pay'
      get 'execute'
    end
  end

  get 'bought_products', to: 'orders#bought_products', as: 'bought_products'

  root 'products#index'

end
