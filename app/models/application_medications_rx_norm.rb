class ApplicationMedicationsRxNorm < ActiveRecord::Base
  belongs_to :application
  belongs_to :medications_rx_norm
end
