class ChangeDataTypeForFieldname < ActiveRecord::Migration
  def self.up
    change_table :dispensed_meds do |t|
      t.change :inventoryid, :bigint
    end
    change_table :inventories do |t|
      t.change :invid, :bigint
    end
  end
  def self.down
    change_table :dispensed_meds do |t|
      t.change :inventoryid, :integer
    end
    change_table :inventories do |t|
      t.change :invid, :integer
    end
  end
end