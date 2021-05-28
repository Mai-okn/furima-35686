Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items do
  end

  resources :trade,only: [:index, :create]
end
