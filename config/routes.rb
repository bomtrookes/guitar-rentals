Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :user do
    resources :bookings
    resources :reviews
    resources :flats
  end

  resources :flats do
    resources :bookings
    resources :reviews
  end

end
