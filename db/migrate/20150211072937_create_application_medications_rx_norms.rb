class CreateApplicationMedicationsRxNorms < ActiveRecord::Migration
  def change
    create_table :application_medications_rx_norms do |t|
      t.integer :application_id
      t.integer :medication_id

      t.timestamps null: false
    end
  end
end
