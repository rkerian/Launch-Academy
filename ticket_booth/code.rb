puts "Hello. How many adult tickets?"
a_tickets = gets.strip.to_i
puts "Lovely. How many child tickets?"
c_tickets = gets.strip.to_i
puts "Coming up with #{a_tickets} adult tickets and #{c_tickets} child tickets."

hot_dog = 1.27
hamburger = 4.17
funnel_cake = 3.79
ice_cream_sandwich = 0.75

puts (hamburger * 2) + (ice_cream_sandwich * 2)
puts (funnel_cake * 8) + hot_dog
puts (hot_dog * 3) + (hamburger * 3) + (funnel_cake * 3) + (ice_cream_sandwich * 3)
