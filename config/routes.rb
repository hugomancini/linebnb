Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :queuers, only: [:new, :create]
  end
  resources :queuers, except: [:new, :create] do
    resources :reservations, only: [:new, :create]
  end
  resources :reservations, except: [:new, :create] do
    resources :reviews, only: [:new, :create]
  end

  get '/statut/:id', to: "reservations#statut", as: :statut
  get '/decline/:id', to: "reservations#declined", as: :decline
end
