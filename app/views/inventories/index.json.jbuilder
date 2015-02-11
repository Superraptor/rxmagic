json.array!(@inventories) do |inventory|
  json.extract! inventory, :id, :invid, :lotno, :expdate, :currentstock, :inventorytype, :datetoreorder, :medicationsrxnormndc
  json.url inventory_url(inventory, format: :json)
end
