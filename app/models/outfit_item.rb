class OutfitItem < ApplicationRecord
  belongs_to :outfit, dependent: :destroy
  belongs_to :clothing_item
end
