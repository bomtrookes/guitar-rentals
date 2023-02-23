Rails.application.routes.draw do
  get 'bookings/index'
  get 'bookings/create'
  get 'bookings/edit'

  devise_for :users

  root to: "pages#home"
  resources :flats do
    resources :bookings
  end

end
