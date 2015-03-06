class PharmManufacturer < ActiveRecord::Base
  has_many :application_pharm_manufacturers
  has_many :applications, :through => :application_pharm_manufacturers

  has_many :medications_rx_norm_pharm_manufacturers
  has_many :medications_rx_norms, :through => :medications_rx_norm_pharm_manufacturers

  validates_uniqueness_of :phid
  validates :phid, :numericality => { :greater_than_or_equal_to => 1 }
  validates_presence_of :manufacturer
  validates_presence_of :minincome
  validates_presence_of :monthsreorder
end
