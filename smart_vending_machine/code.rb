puts "What is the name of the item you would like?"
item_name = gets.strip
puts "How many of #{item_name} woud you like?"
item_quantity = gets.strip
if !item_quantity.index('tons').nil?
  while rand(14) != 0
    puts item_name
  end
else
  item_quantity.to_i.times do
  puts item_name
end
end
