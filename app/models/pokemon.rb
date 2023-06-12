class Pokemon < ApplicationRecord
    validates :name, :size, :species, :pokemon_type, :sound, :image, presence: true
    validates :image, length: {minimum: 10}
end
