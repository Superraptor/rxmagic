class DispensedMed < ActiveRecord::Base
  has_many :dispensed_med_patients
  has_many :patients, :through => :dispensed_med_patients
  
  has_many :dispensed_med_inventories
  has_many :inventories, :through => :dispensed_med_inventories
  
  validates_presence_of :disdate
  validates :patientsid, :numericality => { :greater_than_or_equal_to => 1 }
  validates :inventoryid, :numericality => { :greater_than_or_equal_to => 1 }
end
