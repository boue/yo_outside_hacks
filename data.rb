#1) extract start time and end time separately and store in variable for each artist with "start_time": "8:05" and "end_time" : "9:50"
#2) add in original "shows" hash 
#3) save in a new file 
# start_time = []
# end_time = []

require 'rubygems'
require 'json'
require 'pp'
require 'open-uri'
require 'date'
require 'debugger'

json = File.read("data.json")
parsed = JSON.parse(json)

#method that adds a new key, value pair
def hash_add(hash, new_key, new_value)
  temp_hash = {}
  temp_hash[new_key] = new_value
  temp_hash.merge!(hash)
  hash = temp_hash
end

#final data that is to be written to new file
new_data = [] 


#iteration that adds two new key-value pairs which are start_time and end_time to JSON
parsed.each do |artist|
debugger
	#adds the start time 
	hash_add(artist["shows"][0], "start_time", artist["shows"][0]["time"][0..3] )
debugger
	#adds the end time
	# hash_add(artist["shows"][0], "end_time", artist["shows"][0]["time"][7..10] )
end

#Open file new_data.json and write to it changes
File.open("new_data.json", 'w') do |file|
	file << new_data
end

