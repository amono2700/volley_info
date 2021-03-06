class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :username, :string
    add_column :users, :admin, :boolean, default: false 
    add_column :users, :name, :string
    add_column :users, :image, :string
  end
end
