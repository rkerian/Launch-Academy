mo_money = 0
puts "Enter values to get us to 100: "
while mo_money <= 100
  mo_money += gets.strip.to_i
end
puts "You've reached #{mo_money}"
