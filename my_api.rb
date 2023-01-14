require "http"
system "clear"

puts "enter a number:"
number = gets.chomp

response = HTTP.get("http://numbersapi.com/45")

fun_fact = response.parse(:json)

p fun_fact
