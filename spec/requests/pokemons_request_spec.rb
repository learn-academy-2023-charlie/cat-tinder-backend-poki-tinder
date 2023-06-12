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

        it "doesn't create a pokemon without a name" do
            # The params we are going to send with the request
                pokemon_params = {
                pokemon: {
                    name:nil,
                    species:'sleeping pokemon',
                    size:2.1,
                    sound:'snore',
                    image:'https://shorturl.at/bzGTV',
                    pokemon_type:'normal'
                }
            }
                # Send the request to the  server
        post '/pokemons', params: pokemon_params
        # expect an error if the pokemon_params does not have a name
        expect(response.status).to eq 422
        # Convert the JSON response into a Ruby Hash
        json = JSON.parse(response.body)
        # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
        expect(json['name']).to include "can't be blank"
        end

        it "doesn't create a pokemon without a species" do
            # The params we are going to send with the request
                pokemon_params = {
                    pokemon: {
                    name:'Snorlax',
                    species:nil,
                    size:2.1,
                    sound:'snore',
                    image:'https://shorturl.at/bzGTV',
                    pokemon_type:'normal'
                }
            }
                # Send the request to the  server
        post '/pokemons', params: pokemon_params
        # expect an error if the pokemon_params does not have a species
        expect(response.status).to eq 422
        # Convert the JSON response into a Ruby Hash
        json = JSON.parse(response.body)
        # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
        expect(json['species']).to include "can't be blank"
        end

        it "doesn't create a pokemon without a size" do
            # The params we are going to send with the request
                pokemon_params = {
                pokemon: {
                    name:'Snorlax',
                    species:'sleeping pokemon',
                    size:nil,
                    sound:'snore',
                    image:'https://shorturl.at/bzGTV',
                    pokemon_type:'normal'
                }
            }
                # Send the request to the  server
        post '/pokemons', params: pokemon_params
        # expect an error if the pokemon_params does not have a size
        expect(response.status).to eq 422
        # Convert the JSON response into a Ruby Hash
        json = JSON.parse(response.body)
        # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
        expect(json['size']).to include "can't be blank"
        end

        it "doesn't create a pokemon without a sound" do
            # The params we are going to send with the request
                pokemon_params = {
                pokemon: {
                    name:'Snorlax',
                    species:'sleeping pokemon',
                    size:2.1,
                    sound:nil,
                    image:'https://shorturl.at/bzGTV',
                    pokemon_type:'normal'
                }
            }
                # Send the request to the  server
        post '/pokemons', params: pokemon_params
        # expect an error if the pokemon_params does not have a sound
        expect(response.status).to eq 422
        # Convert the JSON response into a Ruby Hash
        json = JSON.parse(response.body)
        # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
        expect(json['sound']).to include "can't be blank"
        end

        it "doesn't create a pokemon without a image" do
            # The params we are going to send with the request
                pokemon_params = {
                pokemon: {
                    name:'Snorlax',
                    species:'sleeping pokemon',
                    size:2.1,
                    sound:'snore',
                    image:nil,
                    pokemon_type:'normal'
                }
            }
                # Send the request to the  server
        post '/pokemons', params: pokemon_params
        # expect an error if the pokemon_params does not have a image
        expect(response.status).to eq 422
        # Convert the JSON response into a Ruby Hash
        json = JSON.parse(response.body)
        # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
        expect(json['image']).to include "can't be blank"
        end

        it "doesn't create a pokemon without a pokemon_type" do
            # The params we are going to send with the request
                pokemon_params = {
                pokemon: {
                    name:'Snorlax',
                    species:'sleeping pokemon',
                    size:2.1,
                    sound:'snore',
                    image:'https://shorturl.at/bzGTV',
                    pokemon_type:nil
                }
            }
                # Send the request to the  server
        post '/pokemons', params: pokemon_params
        # expect an error if the pokemon_params does not have a pokemon_type
        expect(response.status).to eq 422
        # Convert the JSON response into a Ruby Hash
        json = JSON.parse(response.body)
        # Errors are returned as a one validation failures on an attribute.
        expect(json['pokemon_type']).to include "can't be blank"
        end
    end
end