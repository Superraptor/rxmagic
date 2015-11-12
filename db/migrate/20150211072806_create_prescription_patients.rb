class CreatePrescriptionPatients < ActiveRecord::Migration
  def change
    create_table :prescription_patients do |t|
      t.integer :prescription_id
      t.integer :patient_id

      t.timestamps null: false
    end
  end
end
