class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :user_id
      t.integer :inventory_id

      t.timestamps null: false
    end

    add_index :assignments, :user_id
    add_index :assignments, :inventory_id
  end
end
