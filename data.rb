require 'rubygems'
require 'json'
require 'pp'
require 'open-uri'
require 'nokogiri'

json = File.read("data.json")
parsed = JSON.parse(json)

# doc = Nokogiri::HTML(open("http://www.threescompany.com/"))

parsed.each do |artist|
	PAGE_URL = artist["link"]
	pp PAGE_URL
	page = Nokogiri::HTML(open(PAGE_URL))
	pp page
	# PAGE_URL = Nokogiri::HTML(open(artist["link"]))
	# puts page.css("title").text 
	# time = PAGE_URL.css('ds-arrange ds-performance-location href').text
	# pp time
# 	pp artist["link"]
end

#STEP 1: PARSE THE SET TIMES 
#STEP 2: LINK THEM TO ARTIST
#STEP 3: ADD THEM TO JSON AND SAVE 

#pp parsed[0] - one artist 
