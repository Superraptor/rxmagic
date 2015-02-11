class CreateMedicationsRxNormPharmManufacturers < ActiveRecord::Migration
  def change
    create_table :medications_rx_norm_pharm_manufacturers do |t|
      t.medication_id :integer
      t.manufacturer_id :integer
      
      t.timestamps null: false
    end
  end
end
