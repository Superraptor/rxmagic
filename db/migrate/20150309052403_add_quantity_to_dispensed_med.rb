class AddQuantityToDispensedMed < ActiveRecord::Migration
  def change
    add_column :dispensed_meds, :quantity, :integer
  end
end
