json.array!(@prescriptions) do |prescription|
  json.extract! prescription, :id, :rxID, :dose, :frequency, :route, :date, :medications_rxnorm_ndc, :providers_drID, :patients_ptID
  json.url prescription_url(prescription, format: :json)
end
