class YosController < ApplicationController

	def yo
		if params[:api_key] == ENV["API_KEY"]
			p "YOU ARE IN"
			# .env file with key, value pairs in it
		end
		# @yos = Yo.find(20)
	end

end
