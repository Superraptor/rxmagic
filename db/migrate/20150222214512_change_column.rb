class ChangeColumn < ActiveRecord::Migration
  def change
    change_column :dispensed_meds, :inventoryid, :bigint
    change_column :inventories, :invid, :bigint
  end
end
