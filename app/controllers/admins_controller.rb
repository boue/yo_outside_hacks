class AdminsController < ApplicationController

  def index
  	redirect_to login_path unless session[:logged_in]
  end

end
