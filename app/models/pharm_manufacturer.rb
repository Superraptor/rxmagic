class PharmManufacturer < ActiveRecord::Base
  belongs_to :application, foreign_key: "pharm_manufacturers_phID", class_name: "Application"
  belongs_to :medications_rx_norm, foreign_key: "pharm_manufacturers_phID", class_name: "MedicationsRxNorm"
end
