class RemoveNameFromInventories < ActiveRecord::Migration
  def change
    remove_column :inventories, :name, :string
  end
end
