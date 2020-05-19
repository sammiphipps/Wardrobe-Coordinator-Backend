class ChangeUserColumnNullInClothingItems < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:clothing_items, :user_id, false)
  end
end
