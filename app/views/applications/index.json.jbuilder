json.array!(@applications) do |application|
  json.extract! application, :id, :patients_ptID, :pharm_manufacturers_phID, :medications_rxnorm_ndc, :app_status, :date_init
  json.url application_url(application, format: :json)
end
