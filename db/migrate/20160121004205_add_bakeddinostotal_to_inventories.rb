class AddBakeddinostotalToInventories < ActiveRecord::Migration
  def change
    add_column :inventories, :Bakeddinostotal, :integer
  end
end
