class CreatePrescriptionProviders < ActiveRecord::Migration
  def change
    create_table :prescription_providers do |t|
      t.integer :prescription_id
      t.integer :provider_id

      t.timestamps null: false
    end
  end
end
