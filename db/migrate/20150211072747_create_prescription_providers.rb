class CreatePrescriptionProviders < ActiveRecord::Migration
  def change
    create_table :prescription_providers do |t|
      t.prescription_id :integer
      t.provider_id :integer

      t.timestamps null: false
    end
  end
end
