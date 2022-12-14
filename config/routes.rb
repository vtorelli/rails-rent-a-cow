Rails.application.routes.draw do
  resources :cows do
    collection do
      get :mycows, as: :mycows
    end

    resources :bookings

    resources :tags, only: :create

  end
  resources :tags, only: [] do
    member do
      get :cows
    end
  end
  get "bookings/user_bookings", to: "bookings#user_bookings", as: :user_bookings

  devise_for :users
  root to: "pages#home"
end
