Rails.application.routes.draw do

  resources :instruments do
    resources :bookings, only: [:create, :new]
  end
  resources :bookings, except: [:create, :new] do
    resources :reviews, only: [:index, :show, :create, :new]
  end

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
