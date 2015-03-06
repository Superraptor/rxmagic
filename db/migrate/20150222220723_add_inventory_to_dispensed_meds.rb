class AddInventoryToDispensedMeds < ActiveRecord::Migration
  def change
    change_column :dispensed_meds, :inventoryid, :integer, :limit => 20
    change_column :inventories, :invid, :integer, :limit => 20
  end
end