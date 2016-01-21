class AddWeedtotalToInventories < ActiveRecord::Migration
  def change
    add_column :inventories, :Weedtotal, :integer
  end
end
