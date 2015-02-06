class Application < ActiveRecord::Base
  has_one :medications_rxnorm_ndc, through: :medications_rx_norms, dependent: :nullify
  has_one :patients_ptID, through: :patients, dependent: :nullify
  has_one :pharm_manufacturers_phID, through: :pharm_manufacturers, dependent: :nullify
end
