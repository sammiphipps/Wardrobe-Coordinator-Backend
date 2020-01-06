class CreateClothingItems < ActiveRecord::Migration[6.0]
  def change
    create_table :clothing_items do |t|
      t.string :image_url
      t.string :clothing_type
      t.string :color

      t.timestamps
    end
  end
end
