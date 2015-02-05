class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.integer :rxID
      t.string :dose
      t.string :frequency
      t.string :route
      t.date :date
      t.string :medications_rxnorm_ndc
      t.integer :providers_drID
      t.integer :patients_ptID

      t.timestamps null: false
    end
  end
end
