class MedicationsRxNorm < ActiveRecord::Base
  belongs_to :inventory
  belongs_to :prescriptions
  has_many :pharm_manufacturers, dependent: :nullify
end
