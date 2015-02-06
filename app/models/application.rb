class Application < ActiveRecord::Base
  has_many :medications_rx_norms, dependent: :nullify
  has_many :patients, dependent: :nullify
  has_many :pharm_manufacturers, dependent: :nullify
end
