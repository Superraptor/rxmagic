class CreateInventoryMedicationsRxNorms < ActiveRecord::Migration
  def change
    create_table :inventory_medications_rx_norms do |t|
      t.integer :inventory_id
      t.integer :medication_id

      t.timestamps null: false
    end
  end
end
