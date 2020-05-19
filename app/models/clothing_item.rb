class ClothingItem < ApplicationRecord
    belongs_to :clothing_category
    belongs_to :user
    has_many :outfit_items, dependent: :destroy
    has_many :outfits, through: :outfit_items
end
