class StaticPagesController < ApplicationController
  
  def home
    @activities = PublicActivity::Activity.order("created_at desc")
  end
  
  def about
    @activities = PublicActivity::Activity.order("created_at desc")
  end
  
  def contact
    @activities = PublicActivity::Activity.order("created_at desc")
  end
  
  def expiredApplications
    # @patient = Patient.find(3)
    
    # puts "FIRST NAME: "
    #puts @patient.firstname
    
    # applications = Application.where("dateinit < :week", {:week => 1.week.ago}) # 425 days ago
    # @objects = Object_Name.where("created_at < :week", {:week => 1.week.ago})
    
    #flash[:notice] = "Controller successfully called."
    
    #Application.where("dateinit < :week", {:week => 1.week.ago}).pluck(:patientsptid)
    
    #@application = Application.find(1)
    
    #@expiredApplications = @application.firstname
    
  end
  
  helper_method :expiredApplications
end
