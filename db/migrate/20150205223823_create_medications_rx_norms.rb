class CreateMedicationsRxNorms < ActiveRecord::Migration
  def change
    create_table :medications_rx_norms do |t|
      t.string :ndc
      t.string :med_name
      t.string :min_stock
      t.integer :pharm_manufacturers_phID

      t.timestamps null: false
    end
  end
end
