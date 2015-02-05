class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :invID
      t.string :lot_no
      t.date :exp_date
      t.string :current_stock
      t.string :type
      t.string :date_to_reorder
      t.string :medications_rxnorm_ndc

      t.timestamps null: false
    end
  end
end
