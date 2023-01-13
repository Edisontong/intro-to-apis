require "http"

system "clear"
api = ""

puts "Hello. my name is dictionary. What word would you like to know?"
word = gets.chomp

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=#{api}")

definitions = response.parse(:json)

puts "DEFINITIONS:"
index = 0

while index < definitions.length
  definition = definitions[index]
  puts "#{index + 1}.  #{definition["text"]}"
  puts
  index = index + 1
end

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/examples?includeDuplicates=false&useCanonical=false&limit=5&api_key=#{api}")

example = response.parse(:json)

puts "TOP EXAMPLE:"
puts example["text"]
puts

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=#{api}")

pronunciations = response.parse(:json)

puts "PRONUNCIATIONS: "

index = 0
while index < pronunciations.length
  pronunciation = pronunciations[index]
  puts "#{index + 1}.  #{pronunciation["raw"]}"
  index += 1
end
