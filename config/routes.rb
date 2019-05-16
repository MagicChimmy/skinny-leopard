Rails.application.routes.draw do

 resources :instruments do
    resources :bookings, only: [:index, :create]
    resources :reviews, only: [:index, :create]
  end

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
