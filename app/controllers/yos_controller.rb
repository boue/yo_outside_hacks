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
	  	# if params[:type] == "one" && params[:username]
	  	# 	#send to one user
	  	# elsif params[:type] == "all" 

	  	# else
	  	# 	redirect_to admin_path
  		# end	
  	end


end
