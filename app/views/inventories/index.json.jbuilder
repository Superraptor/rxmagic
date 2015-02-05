json.array!(@inventories) do |inventory|
  json.extract! inventory, :id, :invID, :lot_no, :exp_date, :current_stock, :type, :date_to_reorder, :medications_rxnorm_ndc
  json.url inventory_url(inventory, format: :json)
end
