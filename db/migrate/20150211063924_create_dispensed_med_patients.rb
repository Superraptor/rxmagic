class CreateDispensedMedPatients < ActiveRecord::Migration
  def change
    create_table :dispensed_med_patients do |t|
      t.patient_id :integer
      t.dispensed_med_id :integer

      t.timestamps null: false
    end
  end
end
