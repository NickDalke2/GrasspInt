class AddDinostotalToInventories < ActiveRecord::Migration
  def change
    add_column :inventories, :Dinostotal, :integer
  end
end
