class YosController < ApplicationController

	def yo_receive
		if params[:api_key] == ENV["API_KEY"]
			FIREBASE.push("yos", { :username => params[:username], :timestamp => Time.now })
			counter = FIREBASE.get("counter").body
			counter = counter ? (counter + 1) : 1
			FIREBASE.set("counter", counter)
		end
		redirect_to root_path
	end

	def yo_send
  	if params[:type] == "one" && params[:username]

  		`curl --data "api_token=#{ENV['YO_SECRET']}&username=#{params[:username]}" http://api.justyo.co/yo/`
  	elsif params[:type] == "all"
  		`curl --data "api_token=#{ENV['YO_SECRET']}" http://api.justyo.co/yoall/`
  	end

  	head :no_content
  end

end
