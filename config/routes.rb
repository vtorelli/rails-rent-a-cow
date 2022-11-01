Rails.application.routes.draw do
  resources :cows, only: [:index, :new, :create, :show, :edit, :update]

  devise_for :users
  root to: "pages#home"
end
