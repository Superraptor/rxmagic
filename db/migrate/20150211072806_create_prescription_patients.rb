class CreatePrescriptionPatients < ActiveRecord::Migration
  def change
    create_table :prescription_patients do |t|
      t.prescription_id :integer
      t.patient_id :integer

      t.timestamps null: false
    end
  end
end
