class CreateSesionParticulars < ActiveRecord::Migration[5.1]
  def change
    create_table :sesion_particulars do |t|
      t.date :cita
      t.text :descripcion_sesion
      t.integer :numero_cita

      t.timestamps
    end
  end
end
