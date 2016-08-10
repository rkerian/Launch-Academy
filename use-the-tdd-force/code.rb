# YOUR CODE HERE
def plus_two(number)
  number + 2
end

def subtract_or_multiply_by_two(number)
  number >= 0 ? number * 2 : number - 2
end

def repeat_last_word(string)
  string + " " + string.split(' ').pop.to_s
end

def give_example(input)
  if input == 'string'
    "Hello there."
  elsif input == 'fixnum'
    100
  else
    "input does not match any Ruby class"
  end
end

def output_to_terminal
  puts "Hello World"
end

def add_five_and_ten(new_array)
  new_array.push(5, 10)
  new_array
end
