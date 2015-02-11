class CreateDispensedMeds < ActiveRecord::Migration
  def change
    create_table :dispensed_meds do |t|
      t.date :disdate
      t.integer :patientsid
      t.integer :inventoryid

      t.timestamps null: false
    end
  end
end
