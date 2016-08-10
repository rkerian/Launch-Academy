items_we_have = "chips popcorn skittles clif-bar mentos gum cheetos m&ms"
puts "What item would you like?"
nom = gets.strip
  if !items_we_have.index(nom).nil?
    puts "Item index: #{items_we_have.index(nom)}"
  else
    puts "We don't have that item."
  end
