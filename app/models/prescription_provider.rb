class PrescriptionProvider < ActiveRecord::Base
  belongs_to :prescription
  belongs_to :provider
end
