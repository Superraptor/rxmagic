class Application < ActiveRecord::Base
  has_many :application_medications_rx_norms
  has_many :medications_rx_norms, :through => :application_medications_rx_norms
  
  has_many :application_patients
  has_many :patients, :through => :application_patients
  
  has_many :application_pharm_manufacturers
  has_many :pharm_manufacturers, :through => :application_pharm_manufacturers
  
  validates :patientsptid, :numericality => { :greater_than_or_equal_to => 1 }
  validates :pharmmanufacturersphid, :numericality => { :greater_than_or_equal_to => 1 }
  validates_presence_of :appstatus
  validates_presence_of :dateinit
end
