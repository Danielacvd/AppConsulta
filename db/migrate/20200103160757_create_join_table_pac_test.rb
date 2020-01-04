class CreateJoinTablePacTest < ActiveRecord::Migration[5.1]
  def change
    create_join_table :pacientes, :tests do |t|
      # t.index [:paciente_id, :test_id]
      # t.index [:test_id, :paciente_id]
    end
  end
end
