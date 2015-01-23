Rails.application.routes.draw do
  resources :users

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
