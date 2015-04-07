class PokemonsController < ApplicationController
	def capture
		pokemon = Pokemon.find(params[:id])
		pokemon.trainer = current_trainer
		pokemon.save
		redirect_to :root
	end

	def damage_heal
		if params[:option] == 'damage'
			damage
		else
			heal
		end
	end

	def damage
		Pokemon.find(params[:pokemon_id]).apply_damage
		Pokemon.find(params[:my_pokemon]).add_experience
		redirect_to :back
	end

	def heal
		Pokemon.find(params[:pokemon_id]).apply_heal
		redirect_to :back
	end

	def new
		@pokemon = Pokemon.new
	end

	def create
		# byebug
		pokemon = Pokemon.create(:name => params[:pokemon][:name], :level => 1, :health => 100, :experience => 0)
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
