puts "Exciting. Vacation adventure."
options = ["sailing", "animals", "reservation", "jet skiing"]
puts "Your adventure is #{options.sample}."

puts "But let's really be a stickler for the instructions."
choice = rand(4)
puts "Your adventure is #{options[choice - 1]}."
