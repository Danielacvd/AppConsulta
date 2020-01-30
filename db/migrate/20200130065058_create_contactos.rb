class CreateContactos < ActiveRecord::Migration[5.1]
  def change
    create_table :contactos do |t|
      t.string :nombre
      t.string :apellido
      t.string :correo
      t.text :mensaje

      t.timestamps
    end
  end
end
