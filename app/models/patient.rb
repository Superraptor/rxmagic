class Patient < ActiveRecord::Base
  belongs_to :patient_application, foreign_key: "ptID", class_name: "PatientApplication"
  belongs_to :dispensed_meds, foreign_key: "ptID", class_name: "DispensedMed"
  belongs_to :prescriptions, foreign_key: "ptID", class_name: "Prescription"
end
