class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :invid
      t.string :lotno
      t.date :expdate
      t.string :currentstock
      t.string :inventorytype
      t.date :datetoreorder
      t.string :medicationsrxnormndc

      t.timestamps null: false
    end
  end
end
