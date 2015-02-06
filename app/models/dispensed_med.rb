class DispensedMed < ActiveRecord::Base
  has_one :patient
  has_one :patients_ptID, :through => :patient, :source => :dispensed_meds, dependent: :nullify
  has_one :inventory
  has_one :inventory_invID, :through => :inventory, :source => :dispensed_meds, dependent: :nullify
end
