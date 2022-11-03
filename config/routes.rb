Rails.application.routes.draw do
  resources :cows

  devise_for :users
  root to: "pages#home"
end
