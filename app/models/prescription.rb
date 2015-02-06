class Prescription < ActiveRecord::Base
  has_many :medications_rx_norms, dependent: :nullify
  has_many :providers, dependent: :nullify
  has_many :patients, dependent: :nullify
end
