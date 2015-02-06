class PharmManufacturer < ActiveRecord::Base
  belongs_to :applications
  belongs_to :medications_rx_norms
end
