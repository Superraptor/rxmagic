class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :firstName
      t.string :lastName

      t.timestamps null: false
    end
  end
end
