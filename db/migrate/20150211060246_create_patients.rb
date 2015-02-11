class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.integer :ptid
      t.string :firstname
      t.string :lastname
      t.string :gender
      t.string :dob
      t.string :address
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps null: false
    end
  end
end
