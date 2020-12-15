Rails.application.routes.draw do
  devise_for :users
  root to: "movies#index"
  resources :movies
  resources :users
  post 'movies/:id/add_to_watchlist', to: 'movies#add_to_watchlist'
  get 'watchlists', to: 'movies#watchlists'
  resources :watchlists
end
