class PharmManufacturer < ActiveRecord::Base
  belongs_to :patient_application, foreign_key: "pharm_manufacturers_phID", class_name: "PatientApplication"
  belongs_to :medications_rx_norm, foreign_key: "pharm_manufacturers_phID", class_name: "MedicationsRxNorm"
end
