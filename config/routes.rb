Rails.application.routes.draw do
  resources :cows, only: [:index, :new, :create]

  devise_for :users
  root to: "pages#home"
end
