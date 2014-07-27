class YosController < ApplicationController

	def yo
		if params[:api_key] == ENV["API_KEY"]
			@username = params[:username]
			p @username
			#firebase in there 
			# .env file with key, value pairs in it
		end
		redirect_to root_path
		# @yos = Yo.find(20)
	end

end
