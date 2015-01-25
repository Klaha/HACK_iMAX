Rails.application.routes.draw do

  resources :users
  # resources :cartelera

  ##cartelera
    get '/cartelera', to: 'cartelera#index' 
    get 'cartelera/:id', to: 'cartelera#show', as: 'cartelera_show'
  ##end cartelera

  ##employee

    namespace :employee do
      resources :show_transactions, as: 'transactions', path: 'transactions'
    end

    namespace :employee do
      resources :shows
    end

    get   '/employee',        to: 'employee#index'
    get   '/employee/login',  to: 'employee#login'
    post  '/employee/login',  to: 'employee#create_session'
    get   '/employee/logout', to: 'employee#destroy'

  ##end employee

  namespace :admin do
    resources :movies
  end

  root to: 'cartelera#index'
  
end
