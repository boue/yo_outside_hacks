class YosController < ApplicationController
	
	def yo
		base_uri = 'https://yo-outside-hacks.firebaseio.com/'
		firebase = Firebase::Client.new(base_uri)
		if params[:api_key] == ENV["API_KEY"]
			firebase.push("yos", { :username => params[:username], :timestamp => Time.now })
			counter = firebase.get("counter").body
			counter = counter ? (counter + 1) : 1
			firebase.set("counter", counter)
		end
		redirect_to root_path
	end

end
