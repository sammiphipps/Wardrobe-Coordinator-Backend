class ClothingItem < ApplicationRecord
    belongs_to :clothing_category
    belongs_to :user
end
