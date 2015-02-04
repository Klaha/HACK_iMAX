Rails.application.routes.draw do

  # resources :users
  # resources :cartelera

  ##cartelera
    get '/cartelera', to: 'cartelera#index' 
    get 'cartelera/:id', to: 'cartelera#show', as: 'cartelera_show'
    get 'cartelera/:id/seats', to: 'cartelera#seats', as: 'cartelera_seats'
  ##end cartelera

  ##employee

    namespace :employee do
      resources :show_transactions , as: 'transactions', path: 'transactions'
      get 'transactions/new/seats', to: 'show_transactions#new_seats'
      get 'transactions/new/seats/client', to: 'show_transactions#new_seats_client'
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
  root to: 'cartelera#index'

  #registro usuario

    get :registro, to: 'users#new'
    post :registro, to: 'users#create'
    get :login, to: 'users#login'
    post :login, to: 'users#create_session'
    get   :logout , to: 'users#destroy_session'
  #end registro usuario
end
