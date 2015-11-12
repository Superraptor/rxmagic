class CreateDispensedMedInventories < ActiveRecord::Migration
  def change
    create_table :dispensed_med_inventories do |t|
      t.integer :inventory_id
      t.integer :dispensed_med_id
      
      t.timestamps null: false
    end
  end
end
