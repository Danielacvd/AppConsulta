class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.string :name
      t.string :photo
      t.boolean :diag

      t.timestamps
    end
  end
end
