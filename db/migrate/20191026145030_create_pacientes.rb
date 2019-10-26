class CreatePacientes < ActiveRecord::Migration[5.1]
  def change
    create_table :pacientes do |t|
      t.string :name
      t.string :last_name
      t.string :curso
      t.string :photo
      t.date :birth_date
      t.boolean :role

      t.timestamps
    end
  end
end
