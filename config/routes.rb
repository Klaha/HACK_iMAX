Rails.application.routes.draw do

  # resources :users
  # resources :cartelera

  ##cartelera
  root to: 'cartelera#index'
  get '/cartelera', to: 'cartelera#index'
  get 'cartelera/:id', to: 'cartelera#show', as: 'cartelera_show'
  get 'cartelera/:id/seats', to: 'cartelera#seats', as: 'cartelera_seats'
  post 'cartelera/buy', to: 'cartelera#create'
  get 'cartelera/compra/:transaction_id', to: 'cartelera#view_transaction', as: 'buy_info'

  ##end cartelera

  ##employee

  namespace :employee do
    resources :show_transactions , as: 'transactions', path: 'transactions'
    get 'transactions/new/seats', to: 'show_transactions#new_seats'
    get 'transactions/new/seats/client', to: 'show_transactions#new_seats_client'
    get 'reservations', to: 'show_transactions#reservations'
    get 'reservations/view', to: 'show_transactions#reservations_view'
    patch 'reservations/pay/:id', to: 'show_transactions#reservation_pay', as:'reservation_pay'
  #   reservation_pay

  end

  namespace :employee do
    resources :shows
  end

  get   '/employee',        to: 'employee#index'
  # get   '/employee/login',  to: 'employee#login'
  # post  '/employee/login',  to: 'employee#create_session'


  ##end employee

  namespace :admin do
    resources :movies
  end
  get '/admin', to: 'admin#index'
  get '/admin/price', to: 'admin#price'
  patch '/admin/price', to: 'admin#update_price'

  #registro usuario

  get :registro, to: 'users#new'
  post :registro, to: 'users#create'
  get :login, to: 'users#login'
  post :login, to: 'users#create_session'
  get   :logout , to: 'users#destroy_session'
  #end registro usuario
end
