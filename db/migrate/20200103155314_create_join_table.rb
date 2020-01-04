class CreateJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :pacientes do |t|
      # t.index [:user_id, :paciente_id]
      # t.index [:paciente_id, :user_id]
    end
  end
end
