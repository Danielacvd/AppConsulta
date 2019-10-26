class AddReferencesToSesionParticular < ActiveRecord::Migration[5.1]
  def change
    add_reference :sesion_particulars, :paciente, foreign_key: true
  end
end
