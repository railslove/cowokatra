Rails.application.routes.draw do
  root to: 'users#index'

  resources :users, only: %i(index show)
  resources :orders, only: %i(create)
  resources :payments, only: %i(create)
  resources :cards, only: %i(show new create)
end
