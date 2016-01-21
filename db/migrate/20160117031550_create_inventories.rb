class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :name
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
