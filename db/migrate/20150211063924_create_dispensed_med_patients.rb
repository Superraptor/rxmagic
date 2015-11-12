class CreateDispensedMedPatients < ActiveRecord::Migration
  def change
    create_table :dispensed_med_patients do |t|
      t.integer :patient_id
      t.integer :dispensed_med_id

      t.timestamps null: false
    end
  end
end
