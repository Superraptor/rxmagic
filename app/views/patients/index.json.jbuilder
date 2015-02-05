json.array!(@patients) do |patient|
  json.extract! patient, :id, :ptID, :firstname, :lastname, :gender, :dob, :address, :city, :state, :zip
  json.url patient_url(patient, format: :json)
end
