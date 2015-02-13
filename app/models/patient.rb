class Patient < ActiveRecord::Base
  has_many :dispensed_med_patients
  has_many :dispensed_meds, :through => :dispensed_med_patients
  
  has_many :application_patients
  has_many :applications, :through => :application_patients
  
  has_many :prescription_patients
  has_many :prescriptions, :through => :prescription_patients
  
  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['firstname LIKE ? OR lastname LIKE ?', search_condition, search_condition])
  end
end
