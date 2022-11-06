Rails.application.routes.draw do
  resources :cows do
    collection do
      get :mycows, as: :mycows
    end

    resources :bookings, only: [:new, :create, :index, :show, :edit, :update]

    resources :tags, only: :create
  end

  get "bookings/user_bookings", to: "bookings#user_bookings", as: :user_bookings

  devise_for :users
  root to: "pages#home"
end
