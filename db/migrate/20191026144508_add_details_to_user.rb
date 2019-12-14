class AddDetailsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :photo, :string
    add_reference :users, :cargo, foreign_key: true
    add_column :users, :role, :integer
  end
end
