class Application < ActiveRecord::Base
  has_one :medications_rx_norm
  has_one :medications_rxnorm_ndc, :through => :medications_rx_norm, :source => :application, dependent: :nullify
  has_one :patient
  has_one :patients_ptID, :through => :patient, :source => :application, dependent: :nullify
  has_one :pharm_manufacturer
  has_one :pharm_manufacturers_phID, :through => :pharm_manufacturer, :source => :application, dependent: :nullify
end