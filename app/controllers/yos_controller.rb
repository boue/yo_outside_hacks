class YosController < ApplicationController
	
	
	def yo
		base_uri = 'https://yo-outside-hacks.firebaseio.com/'
		firebase = Firebase::Client.new(base_uri)
		if params[:api_key] == ENV["API_KEY"]
			response = firebase.push("yos", { :username => params[:username], :timestamp => Time.now })
			p response 
			#firebase in there 
			# .env file with key, value pairs in it
		end
		redirect_to root_path
		# @yos = Yo.find(20)
	end

end
