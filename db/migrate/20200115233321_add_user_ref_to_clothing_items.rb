class AddUserRefToClothingItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :clothing_items, :user, null: true, foreign_key: true
  end
end
