Rails.application.routes.draw do
  get 'reservations/index'
  get 'reservations/show'
  get 'reservations/new'
  get 'reservations/create'
  get 'reservations/destroy'
  get 'reservations/update'
  get 'reservations/edit'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :queuers do
    resources :reservations, only: [:new, :create]
  end
  resources :reservations, except: [:new, :create] do
    resources :reviews
  end
end
