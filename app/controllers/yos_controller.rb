class YosController < ApplicationController

	def yo
		if params[:api_key] == ENV["API_KEY"]
			#firebase in there 
			# .env file with key, value pairs in it
		end
		# @yos = Yo.find(20)
	end

end
