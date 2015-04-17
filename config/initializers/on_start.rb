def time_to_reorder
  Inventory.all.each do |inventory|
    reorderdate = Date.new(Date.today.year, inventory.datetoreorder.month, inventory.datetoreorder.day)
    reorderdate += 1.year if Date.today >= reorderdate
    if((reorderdate - Date.today).to_i <= 90)
      @inventory.create_activity key: 'inventory.reorder'
    end
  end
  puts "THIS METHOD RAN!"
end