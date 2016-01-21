class AddBakeddinosToInventories < ActiveRecord::Migration
  def change
    add_column :inventories, :bakeddinos, :integer
  end
end
