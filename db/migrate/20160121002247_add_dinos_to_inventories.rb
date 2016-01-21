class AddDinosToInventories < ActiveRecord::Migration
  def change
    add_column :inventories, :dinos, :integer
  end
end
