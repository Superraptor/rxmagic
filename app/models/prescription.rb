class Prescription < ActiveRecord::Base
  has_many :prescription_providers
  has_many :providers, :through => :prescription_providers
  
  has_many :prescription_medications_rx_norms
  has_many :medications_rx_norms, :through => :prescription_medications_rx_norms
  
  has_many :prescription_patients
  has_many :patients, :through => :prescription_patients
  
  validates_uniqueness_of :rxid
  validates :rxid, :numericality => { :greater_than_or_equal_to => 1 }
  validates_presence_of :dose
  validates_presence_of :frequencytaken
  validates_presence_of :routetaken
  validates_presence_of :dategiven
  validates_presence_of :medicationsrxnormndc
  validates_presence_of :providersdrid
  validates :providersdrid, :numericality => { :greater_than_or_equal_to => 1 }
  validates_presence_of :patientsptid
  validates :patientsptid, :numericality => { :greater_than_or_equal_to => 1 }
end
