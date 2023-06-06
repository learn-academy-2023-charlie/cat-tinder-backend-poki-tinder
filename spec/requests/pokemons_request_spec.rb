require 'rails_helper'

RSpec.describe "Pokemons", type: :request do
    describe "GET /index" do
        it "gets a list of pokemons" do
            Pokemon.create(
                name:'Snorlax',
                species:'sleeping pokemon',
                size:2.1,
                sound:'snore',
                image:'https://shorturl.at/bzGTV',
                pokemon_type:'normal'
            )
# make a request
            get '/pokemons'
            pokemon = JSON.parse(response.body)
            expect(response).to have_http_status(200)
            expect(pokemon.length).to eq 1
        end
    end

    describe "POST /create" do
        it "creates a pokemon" do
# The params we are going to send with the request
          pokemon_params = {
            pokemon: {
                name:'Snorlax',
                species:'sleeping pokemon',
                size:2.1,
                sound:'snore',
                image:'https://shorturl.at/bzGTV',
                pokemon_type:'normal'
            }
          }
# Send the request to the server
          post '/pokemons', params: pokemon_params
# Assure that we get a success back
          expect(response).to have_http_status(200)
# Look up the pokemon we expect to be created in the db
          pokemon = Pokemon.first
# Assure that the created pokemon has the correct attributes
          expect(pokemon.name).to eq 'Snorlax'
        end
    end
end