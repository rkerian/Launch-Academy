munchies = nil
while munchies != 'n'
  puts "Can I get you something?"
  munchies = gets.strip
  require 'pry'
  binding.pry
end
puts "goodbye"
