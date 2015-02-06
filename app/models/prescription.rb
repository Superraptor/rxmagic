class Prescription < ActiveRecord::Base
  has_many :medications_rxnorm_ndc, through: :medications_rxnorm, dependent: :nullify
  has_many :providers_drID, through: :providers, dependent: :nullify
  has_many :patients_ptID, through: :patients, dependent: :nullify
end
