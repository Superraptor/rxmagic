class Patient < ActiveRecord::Base
  belongs_to :applications, foreign_key: "ptID", class_name: "Application"
  belongs_to :dispensed_meds, foreign_key: "ptID", class_name: "DispensedMed"
  belongs_to :prescriptions, foreign_key: "ptID", class_name: "Prescription"
end
