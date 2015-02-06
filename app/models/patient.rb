class Patient < ActiveRecord::Base
  belongs_to :applications
  belongs_to :dispensed_meds
  belongs_to :prescriptions
end
