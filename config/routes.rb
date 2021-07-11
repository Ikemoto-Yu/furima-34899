Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root to: "index"
  resources :items, only: [:index, :new, :create]
  root to: "items#index"
end
