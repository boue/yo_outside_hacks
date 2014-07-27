class YosController < ApplicationController
	
	def yo
		if params[:api_key] == ENV["API_KEY"]
			FIREBASE.push("yos", { :username => params[:username], :timestamp => Time.now })
			counter = FIREBASE.get("counter").body
			counter = counter ? (counter + 1) : 1
			FIREBASE.set("counter", counter)
		end
		redirect_to root_path
	end

end
