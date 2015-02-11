class CreateMedicationsRxNorms < ActiveRecord::Migration
  def change
    create_table :medications_rx_norms do |t|
      t.string :ndc
      t.string :medname
      t.string :minstock
      t.integer :pharmmanufacturersphid

      t.timestamps null: false
    end
  end
end
