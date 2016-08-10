souq_cart = [
  "old paperback book",
  "potato",
  "red onion",
  "dried lemon",
  "frankincense",
  "medicinal herbs",
  "saffron",
  "glass spice jar",
  "red fabric",
  "orange fabric",
  "handicrafts",
  "small Persian rug",
  "medium Persian rug",
  "large Persian rug",
  "extra large Persian rug",
]
cart = [ ]
rejected = [ ]

puts "Howdy, shopper. What is your name?"
name = gets.strip

def add_to_cart(inventory, cart, rejected, name)
  item = nil
  until item == 'stop'
    puts "What would you like to add to your shopping cart? Type stop to stop."
    item = gets.strip
    if !inventory.index(item).nil?
      cart << item
      puts "Added #{item} to your cart."
    elsif item != 'stop'
      puts "Try again"
      rejected << item
    else
      puts "#{name}, here are the items in your cart:"
      cart.each {|item| puts item}
      puts "By the way, you tried to add the following items that we do not have:"
      rejected.each {|reject| puts reject}
    end
  end
end
add_to_cart(souq_cart, cart, rejected, name)
