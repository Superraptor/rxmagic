class DispensedMed < ActiveRecord::Base
  has_one :patient
  has_one :patients_ptID, :through => :patient, :source => :ptID, dependent: :nullify
  has_one :inventory_invID, :through => :inventory, dependent: :nullify
end
