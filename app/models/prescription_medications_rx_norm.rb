class PrescriptionMedicationsRxNorm < ActiveRecord::Base
  belongs_to :prescription
  belongs_to :medications_rx_norm
end
