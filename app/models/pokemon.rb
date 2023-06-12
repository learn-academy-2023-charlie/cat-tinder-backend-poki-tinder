class Pokemon < ApplicationRecord
    validates :name, :size, :species, :pokemon_type, :sound, :image, presence: true
    validates :image, length: {minimum: 10}
    validates :size, numericality: { greater_than_or_equal_to: 0, only_only_float: true }
end
