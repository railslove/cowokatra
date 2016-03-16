Rails.application.routes.draw do
  root to: 'users#index'

  resources :users, only: %i(index show) do
    resources :orders, only: %i(new create)
  end
end
