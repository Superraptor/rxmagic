class Prescription < ActiveRecord::Base
  has_one :medications_rxnorm_ndc, through: :medications_rxnorm, dependent: :nullify
  has_one :providers_drID, through: :providers, dependent: :nullify
  has_one :patients_ptID, through: :patients, dependent: :nullify
end
