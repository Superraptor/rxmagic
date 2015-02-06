class Application < ActiveRecord::Base
  has_many :medications_rxnorm_ndc, through: :medications_rx_norms, dependent: :nullify
  has_many :patients_ptID, through: :patients, dependent: :nullify
  has_many :pharm_manufacturers_phID, through: :pharm_manufacturers, dependent: :nullify
end
