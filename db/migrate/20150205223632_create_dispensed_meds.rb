class CreateDispensedMeds < ActiveRecord::Migration
  def change
    create_table :dispensed_meds do |t|
      t.date :dis_date
      t.integer :patients_ptID
      t.integer :inventory_invID

      t.timestamps null: false
    end
  end
end
