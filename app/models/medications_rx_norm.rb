class MedicationsRxNorm < ActiveRecord::Base
  belongs_to :inventory, foreign_key: "medications_rxnorm_ndc", class_name: "Inventory"
  belongs_to :prescriptions, foreign_key: "medications_rxnorm_ndc", class_name: "Prescription"
  belongs_to :application, foreign_key: "medications_rxnorm_ndc", class_name: "Application"
  has_one :pharm_manufacturer
  has_one :pharm_manufacturers_phID, :through => :pharm_manufacturer, :source => :medications_rx_norm, dependent: :nullify
end