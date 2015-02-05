json.array!(@dispensed_meds) do |dispensed_med|
  json.extract! dispensed_med, :id, :dis_date, :patients_ptID, :inventory_invID
  json.url dispensed_med_url(dispensed_med, format: :json)
end
