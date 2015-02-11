class MedicationsRxNormPharmManufacturer < ActiveRecord::Base
  belongs_to medications_rx_norm
  belongs_to pharm_manufacturer
end
