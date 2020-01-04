class CreateJoinTableTratTest < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tests, :tratamientos do |t|
      # t.index [:test_id, :tratamiento_id]
      # t.index [:tratamiento_id, :test_id]
    end
  end
end
