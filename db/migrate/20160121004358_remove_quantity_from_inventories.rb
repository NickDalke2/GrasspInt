class RemoveQuantityFromInventories < ActiveRecord::Migration
  def change
    remove_column :inventories, :quantity, :integer
  end
end
