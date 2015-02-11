class ApplicationPharmManufacturer < ActiveRecord::Base
  belongs_to :application
  belongs_to :pharm_manufacturer
end
