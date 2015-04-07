class PokemonsController < ApplicationController
	def capture
		pokemon = Pokemon.find(params[:id])
		pokemon.trainer = current_trainer
		pokemon.save
		redirect_to :root
	end

	def damage
		Pokemon.find(params[:pokemon_id]).apply_damage
		redirect_to :back
	end

	def new
		@pokemon = Pokemon.new
	end

	def create
		# byebug
		pokemon = Pokemon.create(:name => params[:pokemon][:name], :level => 1, :health => 100)
		if !pokemon.valid?
			flash[:error] = "Name can't be blank or name already exists."
			redirect_to :back
			return
		end
		pokemon.trainer = current_trainer
		pokemon.save
		redirect_to :controller => :trainers, :action => :show, :id => current_trainer
	end
end
