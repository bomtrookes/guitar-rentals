Rails.application.routes.draw do
  # get 'chatroom/index'
  # get 'messages/index'
  get 'users/edit'
  devise_for :users

  root to: "pages#home"

  resources :users do
    resources :bookings
    resources :reviews
    resources :guitars
    resources :favourites, only: [:index]
  end

  resources :guitars do
    resources :bookings
    resources :reviews
    resources :favourites, only: [:create, :destroy]
    resources :chatrooms do
      resources :messages, only: [:index, :create]
    end

    collection do
      get 'owned'
    end


  end


  resources :bookings, only: :destroy
  resources :reviews, only: :destroy
  resources :guitars, only: :destroy
  resources :chatrooms, only: :index

end
