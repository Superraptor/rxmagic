class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def greeting
    render text: "Charles is a thespian"
  end
  
  def redirect_with_delay(url, delay = 0)
    @redirect_url, @redirect_delay = url, delay
    render
  end
  
  helper_method :reorder
  
  def reorder
    
    
    Inventory.all.each do |inventory|
      reorderdate = Date.new(Date.today.year, inventory.datetoreorder.month, inventory.datetoreorder.day)
      reorderdate += 1.year if Date.today >= reorderdate
      if((reorderdate - Date.today).to_i <= 90)
        if()
          inventory.create_activity key: 'inventory.reorder'
        end
      end
    end
    puts "THIS METHOD RAN!"
  end
end
