class AddWeedToInventories < ActiveRecord::Migration
  def change
    add_column :inventories, :weed, :integer
  end
end
