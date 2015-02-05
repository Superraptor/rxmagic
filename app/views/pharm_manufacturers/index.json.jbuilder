json.array!(@pharm_manufacturers) do |pharm_manufacturer|
  json.extract! pharm_manufacturer, :id, :phID, :manufacturer, :min_income, :months_reorder
  json.url pharm_manufacturer_url(pharm_manufacturer, format: :json)
end
