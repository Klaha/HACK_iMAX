Rails.application.routes.draw do
  resources :users

  root to: 'admin/movies#cartelera'

  namespace :employee do
    resources :transactions
  end

  namespace :employee do
    resources :shows
  end

  namespace :admin do
    resources :movies
  end
  
end
