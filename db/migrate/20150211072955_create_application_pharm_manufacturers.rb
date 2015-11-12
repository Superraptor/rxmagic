class CreateApplicationPharmManufacturers < ActiveRecord::Migration
  def change
    create_table :application_pharm_manufacturers do |t|
      t.integer :application_id
      t.integer :manufacturer_id

      t.timestamps null: false
    end
  end
end
