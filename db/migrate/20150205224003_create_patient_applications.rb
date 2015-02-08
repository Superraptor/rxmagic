class CreatePatientApplications < ActiveRecord::Migration
  def change
    create_table :patient_applications do |t|
      t.integer :patients_ptID
      t.integer :pharm_manufacturers_phID
      t.string :medications_rxnorm_ndc
      t.string :app_status
      t.date :date_init

      t.timestamps null: false
    end
  end
end
