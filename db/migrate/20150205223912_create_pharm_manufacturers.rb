class CreatePharmManufacturers < ActiveRecord::Migration
  def change
    create_table :pharm_manufacturers do |t|
      t.integer :phID
      t.string :manufacturer
      t.string :min_income
      t.string :months_reorder

      t.timestamps null: false
    end
  end
end
