class CreatePharmManufacturers < ActiveRecord::Migration
  def change
    create_table :pharm_manufacturers do |t|
      t.integer :phid
      t.string :manufacturer
      t.string :minincome
      t.string :monthsreorder

      t.timestamps null: false
    end
  end
end
