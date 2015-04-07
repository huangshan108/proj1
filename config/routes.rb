Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  patch '/' => 'pokemons#capture', :as => :capture
  patch 'trainers/:id/:pokemon_id' => 'pokemons#damage', :as => :damage
  get 'pokemon/new' => 'pokemons#new', :as => :pokemons
  post 'pokemon/new' => 'pokemons#create', :as => :self_create_pokemon
end
