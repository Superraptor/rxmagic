class Patient < ActiveRecord::Base
  belongs_to :applications
  belongs_to :dispensed_meds, foreign_key: "ptID", class_name: "DispensedMed"
  belongs_to :prescriptions
end
