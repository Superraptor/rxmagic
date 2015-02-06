class DispensedMed < ActiveRecord::Base
  has_one :patients_ptID, through: :patients, dependent: :nullify
  has_many :inventory_invID, through: :inventories, dependent: :nullify
end
