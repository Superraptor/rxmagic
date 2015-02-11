class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.integer :drid
      t.string :firstname
      t.string :lastname

      t.timestamps null: false
    end
  end
end
