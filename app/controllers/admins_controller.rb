class AdminsController < ApplicationController
  
  def index
  	#renders page with log in box 
  end

  def yo
  	admin.logged_in?
	  	if params[:type] == "one" && params[:username]
	  		#send to one user
	  	elsif params[:type] == "all" 
	  		#render all page with button to send to all 
  		end	
  end

end
