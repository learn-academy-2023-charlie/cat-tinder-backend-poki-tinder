class Pokemon < ApplicationRecord
    validates :name, :size, :species, :pokemon_type, :sound, :image, presence: true
    validates :image, length: {minimum: 10}
    validates :size, numericality: { greater_than_or_equal_to: 0, only_only_float: true }
    validate :unique_name_case_insensitive


  private
  def unique_name_case_insensitive
    existing_pokemon = Pokemon.where('LOWER(name) = ?', name.downcase)
    if existing_pokemon.exists?
      errors.add(:name, 'already exists in the poki-tinder app')
    end
  end
end
