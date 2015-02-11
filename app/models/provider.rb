class Provider < ActiveRecord::Base
  has_many :prescription_providers
  has_many :prescriptions, :through => :prescription_providers
end
