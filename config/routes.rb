Rails.application.routes.draw do
  root to: 'users#index'

  resources :users, only: %i(index show) do
    member do
      patch :pay
    end
  end
  resources :orders, only: %i(create)
end
