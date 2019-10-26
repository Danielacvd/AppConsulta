class CreateSesionColegios < ActiveRecord::Migration[5.1]
  def change
    create_table :sesion_colegios do |t|
      t.date :cita
      t.text :descripcion
      t.integer :numero_cita

      t.timestamps
    end
  end
end
