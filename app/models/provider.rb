class Provider < ActiveRecord::Base
  has_many :prescription_providers
  has_many :prescriptions, :through => :prescription_providers

  validates_presence_of :drid
  validates :drid, :numericality => { :greater_than_or_equal_to => 1 }
  validates_presence_of :firstname
  validates_presence_of :lastname
end
