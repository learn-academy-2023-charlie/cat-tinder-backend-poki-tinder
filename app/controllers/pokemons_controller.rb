class PokemonsController < ApplicationController
   
    def index
        pokemons = Pokemon.all
        render json: pokemons
    end

    def create
        # create a new poke
        pokemon = Pokemon.create(pokemon_params)
        if pokemon.valid?
            render json: pokemon
        else 
            render json: pokemon.errors, status: 422
        end
    end

    def update
    end

    def destroy
    end

    private
    def pokemon_params
        params.require(:pokemon).permit(:name, :species, :pokemon_type, :size, :sound, :image)
    end
end
