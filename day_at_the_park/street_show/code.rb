# Knife Juggling
# - $2.10
# - $0.77
# - $5.00
# - $1.00
# - $3.00
#
# Torch Juggling
# - $6.00
# - $3.50
# - $7.00
#
# Hand Balancing
# - $2.00
# - $1.00
#
# Human Blockhead - [resource](http://en.wikipedia.org/wiki/Human_Blockhead)
# - $0.75
# - $0.43

knife_total = 2.10 + 0.77 + 5.00 + 1.00 + 3.00
torch_total = 6.00 + 3.50 + 7.00
hand_total = 2.00 + 1.00
human_total = 0.75 + 0.43
complete_total = (knife_total + torch_total + hand_total + human_total).round(2)

puts "Knife Juggling: $#{knife_total.round(2)}."
puts "Torch Juggling: $#{torch_total.round(2)}."
puts "Hand Balancing: $#{hand_total.round(2)}."
puts "Human Blockhead: $#{human_total.round(2)}."
puts "Total income: $#{complete_total}"
puts "Average tip: $#{(complete_total / 12).round(2)}"

puts "Time for a volunteer. Thanks for volunteering. What is your name?"
name = gets.strip
puts "Clap for #{name}. Everyone is so happy. Good. Good. #{name}, what is your favorite number?"
fav_number = gets.strip.to_i
puts "Lovely. We will juggle these knives #{fav_number} times just for you my fine friend."
