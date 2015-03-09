class StaticPagesController < ApplicationController
  def home
  end
  
  def expiredApplications
    
    
    
    # applications = Application.where("dateinit < :week", {:week => 1.week.ago}) # 425 days ago
    # @objects = Object_Name.where("created_at < :week", {:week => 1.week.ago})
    
    Application.where("dateinit < :week", {:week => 1.week.ago}).pluck(:patientsptid)
    
  end
  
  helper_method :expiredApplications
end
