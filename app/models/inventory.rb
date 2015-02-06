class Inventory < ActiveRecord::Base
  belongs_to :dispensed_meds
  has_many :medications_rxnorm_ndc, through: :medications_rx_norms, dependent: :nullify
end
