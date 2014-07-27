require 'rubygems'
require 'json'
require 'pp'
require 'open-uri'
require 'nokogiri'

json = File.read("data.json")
parsed = JSON.parse(json)

# doc = Nokogiri::HTML(open("http://www.threescompany.com/"))

parsed.each do |artist|
	page_url = artist["link"]
	pp page_url
	page = Nokogiri::HTML(open(page_url))
	pp page.css('html body.ds-not-logged-in.ds-band-show-page div#page div#ds-content-outer-wrapper div#ds-content-wrapper div#ds-content-inner-wrapper div#ds-content div.ds-header div.ds-arrange.ds-performance-location p a').text
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
