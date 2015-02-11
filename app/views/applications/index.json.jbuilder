json.array!(@applications) do |application|
  json.extract! application, :id, :patientsptid, :pharmmanufacturersphid, :medicationsrxnormndc, :appstatus, :dateinit
  json.url application_url(application, format: :json)
end
