json.array!(@dispensed_meds) do |dispensed_med|
  json.extract! dispensed_med, :id, :disdate, :patientsid, :inventoryid
  json.url dispensed_med_url(dispensed_med, format: :json)
end
