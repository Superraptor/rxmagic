class CreateApplicationPatients < ActiveRecord::Migration
  def change
    create_table :application_patients do |t|
      t.integer :application_id
      t.integer :patient_id

      t.timestamps null: false
    end
  end
end
