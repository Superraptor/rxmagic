class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :patientsptid
      t.integer :pharmmanufacturersphid
      t.string :medicationsrxnormndc
      t.string :appstatus
      t.date :dateinit

      t.timestamps null: false
    end
  end
end
