json.array!(@prescriptions) do |prescription|
  json.extract! prescription, :id, :rxid, :dose, :frequencytaken, :routetaken, :dategiven, :medicationsrxnormndc, :providersdrid, :patientsptid
  json.url prescription_url(prescription, format: :json)
end
