Rails.application.routes.draw do
  devise_for :users
  resources :products do
    resources :orders, only: :create
  end

  get 'cart', to: 'orders#cart', as: 'cart'

  root 'products#index'

end
