Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :users do
    resources :bookings
    resources :reviews
    resources :guitars
  end

  resources :guitars do
    resources :bookings
    resources :reviews
  end

end
