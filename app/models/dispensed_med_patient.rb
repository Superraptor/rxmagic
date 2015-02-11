class DispensedMedPatient < ActiveRecord::Base
  belongs_to :patient
  belongs_to :dispensed_med
end
