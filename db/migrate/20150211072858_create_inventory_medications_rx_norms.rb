class CreateInventoryMedicationsRxNorms < ActiveRecord::Migration
  def change
    create_table :inventory_medications_rx_norms do |t|
      t.inventory_id :integer
      t.medication_id :integer

      t.timestamps null: false
    end
  end
end
