require 'pry'

def print_puzzle(word, guesses = '')
  word_array = []
  word.each_char do |c|
    if guesses.include?(c)
      word_array << c
    else
      word_array << '_'
    end
  end
puts word_array.join
end
print_puzzle("puppy", "pu")
