class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :species
      t.decimal :size
      t.string :sound
      t.text :image

      t.timestamps
    end
  end
end
