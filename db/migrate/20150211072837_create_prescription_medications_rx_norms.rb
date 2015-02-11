class CreatePrescriptionMedicationsRxNorms < ActiveRecord::Migration
  def change
    create_table :prescription_medications_rx_norms do |t|
      t.prescription_id :integer
      t.medication_id :integer

      t.timestamps null: false
    end
  end
end
