class CreateApplicationMedicationsRxNorms < ActiveRecord::Migration
  def change
    create_table :application_medications_rx_norms do |t|
      t.application_id :integer
      t.medication_id :integer

      t.timestamps null: false
    end
  end
end
