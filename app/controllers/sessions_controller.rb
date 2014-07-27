class SessionsController < ApplicationController

	def new
		
	end

	def create
		if params[:password] == ENV["ADMIN_PASSWORD"] && params[:username] == ENV["ADMIN_USERNAME"]
			session[:logged_in] = true 
			redirect_to admin_path 
		else
			flash[:notice] = "Invalid credentials"
			redirect_to login_path 
		end
	end

	def delete
		session.destroy
		redirect_to root_path
	end

end