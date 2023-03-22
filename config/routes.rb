Rails.application.routes.draw do
  get 'chatroom/index'
  get 'messages/index'
  get 'users/edit'
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

    resources :chatrooms do
      resources :messages
    end

    collection do
      get 'owned'
    end

  end


  resources :bookings, only: :destroy
  resources :reviews, only: :destroy
  resources :guitars, only: :destroy

end
