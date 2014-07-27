class AdminsController < ApplicationController

  def index
  	#renders page with log in box
  	if admin.logged_in?

  	else
  		flash[:notice] = "Invalid Admin username/password combination"
  		redirect_to admin_path
  	end
  end

  def show

  end

end
