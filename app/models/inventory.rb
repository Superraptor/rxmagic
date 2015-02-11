class Inventory < ActiveRecord::Base
  has_many :dispensed_med_inventories
  has_many :dispensed_meds, :through => :dispensed_med_inventories

  has_many :inventory_medications_rx_norms
  has_many :medications_rx_norms, :through => :inventory_medications_rx_norms

end
