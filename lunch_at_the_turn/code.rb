menu = {

  'hamburger' => 4.00,
  'hot dog' => 3.00,
  'fries' => 2.00,
  'chips' => 1.00,
  'water' => 1.25,
  'soda' => 1.50
}

yum = []
error = false

puts "Hi. This is another store. Order (separate by commas)."
order = gets.strip.downcase
yum = order.split(',')

yum.each do |item|
  if !menu.has_key?(item)
    puts "Um, we don't have #{item}, friend."
    error = true
  end
end

total = 0.0

if error == false
  yum.each do |item|
    total += menu[item]
  end
  puts "Hi boss. Your total is $#{total}."
else
  puts "No total for you."
end
