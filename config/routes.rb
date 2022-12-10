Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'movies/show'
  get 'movies/index'
  resources :lists do
     resources :bookmarks
   end

   resources :movies

   # Defines the root path route ("/")
  root "lists#index"
end
