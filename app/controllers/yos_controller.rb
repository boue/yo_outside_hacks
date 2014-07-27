class YosController < ApplicationController

	def yo
		if params[:api_key] == ENV[API_KEY]
			# .env file with key, value pairs in it
			c1528fbba492bffb57aae12a8abfa0c80e671939b5040fa4a0145101b96e8e9c
		# @yos = Yo.find(20)
	end

end
