Rails.application.routes.draw do
  resources :users

  root to: 'admin/movies#cartelera'

  namespace :employee do
    resources :transactions
  end

  ##employee
  namespace :employee do
    resources :shows
  end

  get '/employee', to: 'employee#index'
  get '/employee/login', to: 'employee#login'
  post '/employee/login', to: 'employee#create_session'
  get '/employee/logout', to: 'employee#destroy'

##end employee


  namespace :admin do
    resources :movies
  end
  
end
