require 'pry'
earthquake = [[5,3,7],[3,3,1],[4,1,2]]
building_age = 12
building_strength = 0
first_q = 0
second_q = 0
third_q = 0

building_strength = 1000 - ((1000 * 0.01) * building_age)

 earthquake.each_with_index do |quake, index|
   quake.each do |shock|
     if index == 0
       first_q += shock
     elsif index == 1
       second_q += shock
     else
       third_q += shock
     end
   end
end
   #binding.pry

earthquake_strength = first_q * second_q * third_q

puts "Building Strength: #{building_strength}"
puts "Earthquake Strength: #{earthquake_strength}"

if building_strength > earthquake_strength
  puts "Safe"
else
  puts "Needs Reinforcement!"
end
