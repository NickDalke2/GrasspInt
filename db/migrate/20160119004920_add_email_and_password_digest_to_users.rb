class AddEmailAndPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_index :users, :email
    add_column :users, :password_digest, :string
  end
end
