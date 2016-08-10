cubic_feet = (8 * 20 * 8).to_f / 12
puts "Cubic feet: #{cubic_feet}."
  if cubic_feet <= 50
    quote_price = 20
  elsif cubic_feet <= 150
    quote_price = 50
  elsif cubic_feet <= 300
    quote_price = 100
  else
    quote_price = 150
  end
  puts "Quote price: $#{quote_price}"
