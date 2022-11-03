Rails.application.routes.draw do
  resources :cows do
    collection do
      get :mycows, as: :mycows
    end
  end


  resources :bookings, only: [:index, :show, :edit, :update]
  devise_for :users
  root to: "pages#home"
end
