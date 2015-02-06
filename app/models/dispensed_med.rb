class DispensedMed < ActiveRecord::Base
  has_one :patients_ptID, through: :patients_id, dependent: :nullify
  has_one :inventory_invID, through: :inventory, dependent: :nullify
end
