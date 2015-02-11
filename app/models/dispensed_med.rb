class DispensedMed < ActiveRecord::Base
  has_many :dispensed_med_patients
  has_many :patients, :through => :dispensed_med_patients
  
  has_many :dispensed_med_inventories
  has_many :inventories, :through => :dispensed_med_inventories
end
