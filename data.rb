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

def hash_add(hash, new_key, new_value)
  temp_hash = {}
  temp_hash[new_key] = new_value
  temp_hash.merge!(hash)
  hash = temp_hash
  puts hash
end


File.open("new_data.json", 'w') do |file|
	parsed.each do |artist|
		hash_add(artist["shows"][0], "start_time", artist["shows"][0]["time"][0..3] )
		hash_add(artist["shows"][0], "end_time", artist["shows"][0]["time"][7..10] )
	end
	file.write(parsed)
end

