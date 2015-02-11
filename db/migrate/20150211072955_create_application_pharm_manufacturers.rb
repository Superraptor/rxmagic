class CreateApplicationPharmManufacturers < ActiveRecord::Migration
  def change
    create_table :application_pharm_manufacturers do |t|
      t.application_id :integer
      t.manufacturer_id :integer

      t.timestamps null: false
    end
  end
end
