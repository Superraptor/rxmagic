class CreateApplicationPatients < ActiveRecord::Migration
  def change
    create_table :application_patients do |t|
      t.application_id :integer
      t.patient_id :integer

      t.timestamps null: false
    end
  end
end
