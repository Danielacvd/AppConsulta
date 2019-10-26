class CreateTratamientos < ActiveRecord::Migration[5.1]
  def change
    create_table :tratamientos do |t|
      t.string :name
      t.string :plan

      t.timestamps
    end
  end
end
