class DispensedMed < ActiveRecord::Base
  has_one :patients
  has_one :patients_ptID, :through => :patients, dependent: :nullify
  has_one :inventory_invID, :through => :inventory, dependent: :nullify
end
