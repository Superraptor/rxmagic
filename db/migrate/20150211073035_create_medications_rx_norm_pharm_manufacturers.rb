class CreateMedicationsRxNormPharmManufacturers < ActiveRecord::Migration
  def change
    create_table :medications_rx_norm_pharm_manufacturers do |t|
      t.integer :medication_id
      t.integer :manufacturer_id
      
      t.timestamps null: false
    end
  end
end
