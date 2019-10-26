class AddReferencesToSesionColegio < ActiveRecord::Migration[5.1]
  def change
    add_reference :sesion_colegios, :tratamiento, foreign_key: true
  end
end
