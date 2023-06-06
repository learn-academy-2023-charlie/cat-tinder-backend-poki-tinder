class AddTypeToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :type, :string
  end
end
