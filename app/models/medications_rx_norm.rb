class MedicationsRxNorm < ActiveRecord::Base
  has_many :application_medications_rx_norms
  has_many :applications, :through => :application_medications_rx_norms

  has_many :inventory_medications_rx_norms
  has_many :inventories, :through => :inventory_medications_rx_norms

  has_many :medications_rx_norm_pharm_manufacturers
  has_many :pharm_manufacturers, :through => :medications_rx_norm_pharm_manufacturers

  has_many :prescription_medications_rx_norms
  has_many :prescriptions, :through => :prescription_medications_rx_norms
end
