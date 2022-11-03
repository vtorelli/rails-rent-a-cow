Rails.application.routes.draw do
  resources :cows, only: [:index, :new, :create, :show, :edit, :update] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show, :edit, :update]
  devise_for :users
  root to: "pages#home"
end
