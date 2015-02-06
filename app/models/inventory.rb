class Inventory < ActiveRecord::Base
  belongs_to :dispensed_meds, foreign_key: "invID", class_name: "DispensedMed"
  has_many :medications_rx_norm
  has_many :medications_rxnorm_ndc, :through => :medications_rx_norm, :source => :inventory, dependent: :nullify
end
