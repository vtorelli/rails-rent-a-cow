Rails.application.routes.draw do
  resources :cows do
    collection do
      get :mycows, as: :mycows
    end
  end

  devise_for :users
  root to: "pages#home"
end
