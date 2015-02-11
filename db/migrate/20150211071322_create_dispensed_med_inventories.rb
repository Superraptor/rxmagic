class CreateDispensedMedInventories < ActiveRecord::Migration
  def change
    create_table :dispensed_med_inventories do |t|
      t.inventory_id :integer
      t.dispensed_med_id :integer
      
      t.timestamps null: false
    end
  end
end
