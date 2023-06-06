require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  it 'should not be valid without a name' do
  pokemon = Pokemon.create(
    name:nil,
    species:normal,
    size:2.1,
    sound:'snore',
    image:'https://shorturl.at/bzGTV',
    pokemon_type:'normal'
  )
  expect(pokemon.errors[:name]).to_not be_empty
  end

  it 'should not be valid without an species' do
    pokemon = Pokemon.create(
      name:'Snorlax',
      species:nil,
      size:2.1,
      sound:'snore',
      image:'https://shorturl.at/bzGTV',
      pokemon_type:'normal'
    )
    expect(pokemon.errors[:species]).to_not be_empty
  end

  it 'should not be valid without an size' do
    pokemon = Pokemon.create(
      name:'Snorlax',
      species:normal,
      size:nil,
      sound:'snore',
      image:'https://shorturl.at/bzGTV',
      pokemon_type:'normal'
    )
    expect(pokemon.errors[:size]).to_not be_empty
  end

  it 'should not be valid without an sound' do
    pokemon = Pokemon.create(
      name:'Snorlax',
      species:normal,
      size:2.1,
      sound:nil,
      image:'https://shorturl.at/bzGTV',
      pokemon_type:'normal'
    )
    expect(pokemon.errors[:sound]).to_not be_empty
  end

  it 'should not be valid without an image' do
    pokemon = Pokemon.create(
      name:'Snorlax',
      species:normal,
      size:2.1,
      sound:'snore',
      image:nil,
      pokemon_type:'normal'
    )
    expect(pokemon.errors[:image]).to_not be_empty
  end

  it 'should not be valid without an pokemon_type' do
    pokemon = Pokemon.create(
      name:'Snorlax',
      species:normal,
      size:2.1,
      sound:'snore',
      image:'https://shorturl.at/bzGTV',
      pokemon_type:nil
    )
    expect(pokemon.errors[:pokemon_type]).to_not be_empty
  end

  it 'should not be valid with an image that has less than 10 characters' do
    pokemon = Pokemon.create(
      name:'Snorlax',
      species:normal,
      size:2.1,
      sound:'snore',
      image:'https://shorturl.at/bzGTV',
      pokemon_type:normal
    )
    expect(pokemon.errors[:image]).to_not be_empty
  end
  
end
