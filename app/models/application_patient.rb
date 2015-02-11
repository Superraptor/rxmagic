class ApplicationPatient < ActiveRecord::Base
  belongs_to :application
  belongs_to :patient
end
