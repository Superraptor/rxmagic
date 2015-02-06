class MedicationsRxNorm < ActiveRecord::Base
  belongs_to :inventory
  belongs_to :prescriptions
  has_one :pharm_manufacturers_phID, through: :pharm_manufacturers, dependent: :nullify
end
