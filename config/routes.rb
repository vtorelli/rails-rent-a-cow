Rails.application.routes.draw do
  resources :cows, only: [:new, :create]

  devise_for :users
  root to: "pages#home"
end
