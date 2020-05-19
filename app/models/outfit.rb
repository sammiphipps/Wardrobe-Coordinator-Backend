class Outfit < ApplicationRecord
  belongs_to :user
  has_many :outfit_items, dependent: :destroy
  has_many :clothing_items, through: :outfit_items
end
