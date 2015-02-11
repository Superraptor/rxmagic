class DispensedMedInventory < ActiveRecord::Base
  belongs_to :dispensed_med
  belongs_to :inventory
end
