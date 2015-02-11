json.array!(@medications_rx_norms) do |medications_rx_norm|
  json.extract! medications_rx_norm, :id, :ndc, :medname, :minstock, :pharmmanufacturersphid
  json.url medications_rx_norm_url(medications_rx_norm, format: :json)
end
