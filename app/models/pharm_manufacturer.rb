class PharmManufacturer < ActiveRecord::Base
  belongs_to :applications, foreign_key: "pharm_manufacturers_id", class_name: "Application"
  belongs_to :medications_rx_norms, foreign_key: "pharm_manufacturers_id", class_name: "MedicationRxNorm"
end
