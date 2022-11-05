Rails.application.routes.draw do
  resources :cows do
    collection do
      get :mycows, as: :mycows
    end

    resources :bookings, only: [:new, :create, :index, :show, :edit, :update]
  end

  devise_for :users
  root to: "pages#home"
end
