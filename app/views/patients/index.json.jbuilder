json.array!(@patients) do |patient|
  json.extract! patient, :id, :firstName, :lastName
  json.url patient_url(patient, format: :json)
end
