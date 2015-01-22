Rails.application.routes.draw do
  resources :users
  resources :movies
  
  # Rutas Custom
  get '/adminn/peliculas' => 'movies#new'
end
