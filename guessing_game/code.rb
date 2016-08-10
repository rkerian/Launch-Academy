require 'pry'

puts "Welcome to our dungeon game. Do you like it easy or hard?"
how_hard = gets.strip.downcase
if how_hard == 'easy'
  number = rand(10)
  puts "I'm guessing a number between 1 and 10."
else
  number = rand(20)
  puts "I'm guessing a number between 1 and 20."
end
binding.pry
total_guesses = 1

puts "Guess the number!"
guess = gets.strip.to_i
while guess != number
  puts "Guess the number:"
  guess = gets.strip.to_i
  total_guesses += 1
end
puts "You guessed it! It took you #{total_guesses} guesses!"
