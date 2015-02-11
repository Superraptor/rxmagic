class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.integer :rxid
      t.string :dose
      t.string :frequencytaken
      t.string :routetaken
      t.date :dategiven
      t.string :medicationsrxnormndc
      t.integer :providersdrid
      t.integer :patientsptid

      t.timestamps null: false
    end
  end
end
