class Prescription < ActiveRecord::Base
  has_one :medications_rx_norm
  has_one :medications_rxnorm_ndc, :through => :medications_rx_norm, :source => :prescriptions,  dependent: :nullify
  has_one :provider
  has_one :providers_drID, :through => :provider, :source => :prescriptions, dependent: :nullify
  has_one :patient
  has_one :patients_ptID, :through => :patient, :source => :prescriptions, dependent: :nullify
end
