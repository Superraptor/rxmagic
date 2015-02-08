json.array!(@patient_applications) do |patient_application|
  json.extract! patient_application, :id, :patients_ptID, :pharm_manufacturers_phID, :medications_rxnorm_ndc, :app_status, :date_init
  json.url patient_application_url(patient_application, format: :json)
end
