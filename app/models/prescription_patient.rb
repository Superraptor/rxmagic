class PrescriptionPatient < ActiveRecord::Base
  belongs_to :prescription
  belongs_to :patient
end
