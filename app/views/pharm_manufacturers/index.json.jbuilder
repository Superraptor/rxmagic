json.array!(@pharm_manufacturers) do |pharm_manufacturer|
  json.extract! pharm_manufacturer, :id, :phid, :manufacturer, :minincome, :monthsreorder
  json.url pharm_manufacturer_url(pharm_manufacturer, format: :json)
end
