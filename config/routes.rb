Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  patch '/' => 'pokemons#capture', :as => :capture
  patch 'trainers/:id/:pokemon_id' => 'pokemons#damage_heal', :as => :damage_heal
  get 'pokemon/new' => 'pokemons#new', :as => :pokemons
  post 'pokemon/new' => 'pokemons#create', :as => :self_create_pokemon
end
