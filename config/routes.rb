Rails.application.routes.draw do
  root to: 'users#index'

  resources :users do
    member do
      resources :payments, only: %i(create) do
        collection do
          post 'payoff'
        end
      end
    end
  end
  resources :orders, only: %i(create)
  resources :cards, only: %i(show new create)

  get :reporting, to: 'report#global'
end
