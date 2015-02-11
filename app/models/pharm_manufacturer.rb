class PharmManufacturer < ActiveRecord::Base
  has_many :application_pharm_manufacturers
  has_many :applications, :through => :application_pharm_manufacturers

  has_many :medications_rx_norm_pharm_manufacturers
  has_many :medications_rx_norms, :through => :medications_rx_norm_pharm_manufacturers
end
