json.array!(@providers) do |provider|
  json.extract! provider, :id, :drid, :firstname, :lastname
  json.url provider_url(provider, format: :json)
end
