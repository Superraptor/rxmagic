class CreatePrescriptionMedicationsRxNorms < ActiveRecord::Migration
  def change
    create_table :prescription_medications_rx_norms do |t|
      t.integer :prescription_id
      t.integer :medication_id

      t.timestamps null: false
    end
  end
end
