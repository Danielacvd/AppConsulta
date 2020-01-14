class AddReferencesToTratamiento < ActiveRecord::Migration[5.1]
  def change
    add_reference :tratamientos, :paciente, foreign_key: true
  end
end
