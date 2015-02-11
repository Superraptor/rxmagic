class Prescription < ActiveRecord::Base
  has_many :prescription_providers
  has_many :providers, :through => :prescription_providers
  
  has_many :prescription_medications_rx_norms
  has_many :medications_rx_norms, :through => :prescription_medications_rx_norms
  
  has_many :prescription_patients
  has_many :patients, :through => :prescription_patients
end
