Rails.application.routes.draw do
  resources :users
  resources :movies
  
  get '/adminn/peliculas' => 'movies#new'
end
