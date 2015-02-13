class Patient < ActiveRecord::Base
  has_many :dispensed_med_patients
  has_many :dispensed_meds, :through => :dispensed_med_patients
  
  has_many :application_patients
  has_many :applications, :through => :application_patients
  
  has_many :prescription_patients
  has_many :prescriptions, :through => :prescription_patients
  
  validates_uniqueness_of :ptid
  validates :ptid, :numericality => { :greater_than_or_equal_to => 1 }
  
  validates_presence_of :firstname
  validates_presence_of :lastname
  validates_presence_of :gender
  
  validates_length_of :zip, minimum: 5, too_short: '. Please enter at least 5 characters.'
  
  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['firstname LIKE ? OR lastname LIKE ?', search_condition, search_condition])
  end
end
