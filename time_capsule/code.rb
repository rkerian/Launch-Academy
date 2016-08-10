time_capsule = [ ]
puts "Hello, earthling. What is your given name?"
name = gets.strip

item = nil
until item == 'stop'
  puts "What would you like to add to our time capsule? Type stop to stop."
  item = gets.strip
  if item != 'stop'
    puts "How many #{item}(s) would you like to add?"
    item_count = gets.strip.to_i

    time_capsule << [item, item_count]
    puts "Added #{item} to your cart."
    end
end
puts "#{name}, here is what you put in the time capsule:"
time_capsule.each {|item, count| puts "#{item} (#{count})"}
