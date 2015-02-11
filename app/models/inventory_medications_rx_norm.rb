class InventoryMedicationsRxNorm < ActiveRecord::Base
  belongs_to :inventory
  belongs_to :medications_rx_norm
end
