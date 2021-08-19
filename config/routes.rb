Rails.application.routes.draw do
  devise_for :users
  resources :items do
    resources :purchases, only: [:index, :create]
    collection do
      get 'search'
    end
    end
  root to: "items#index"
end
