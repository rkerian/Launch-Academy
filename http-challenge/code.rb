require "nokogiri"
require "pry"
require "net/http"
require 'open-uri'

# Your code, here.
uri = URI("http://launch-academy-chat.herokuapp.com/messages")
messages = Net::HTTP.get(uri)
doc = Nokogiri::HTML(messages)
doc.css("div.pure-u-1-2.content").each do |message|
  puts message.text
end
binding.pry
