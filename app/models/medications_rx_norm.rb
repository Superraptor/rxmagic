class MedicationsRxNorm < ActiveRecord::Base
  has_many :application_medications_rx_norms
  has_many :applications, :through => :application_medications_rx_norms

  has_many :inventory_medications_rx_norms
  has_many :inventories, :through => :inventory_medications_rx_norms

  has_many :medications_rx_norm_pharm_manufacturers
  has_many :pharm_manufacturers, :through => :medications_rx_norm_pharm_manufacturers

  has_many :prescription_medications_rx_norms
  has_many :prescriptions, :through => :prescription_medications_rx_norms

  validates_presence_of :ndc
  validates_presence_of :minstock
  validates_presence_of :pharmmanufacturersphid
  validates :pharmmanufacturersphid, :numericality => { :greater_than_or_equal_to => 1 }


end
