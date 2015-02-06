class Provider < ActiveRecord::Base
  belongs_to :prescriptions, foreign_key: "providers_drID", class_name: "Prescription"
end
