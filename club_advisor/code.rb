clubs = {

'driver' => 200,
"four wood" => 180,
"five wood" => 170,
"two iron" => 170,
"three iron" => 160,
"four iron" => 150,
"five iron" => 140,
"six iron" => 130,
"seven iron" => 120,
"eight iron" => 110,
"nine iron" => 95,
"pitching wedge" => 80,
"sand Wedge" => 20,
"putter" => 0
}

puts "How far away are you?"
distance = gets.strip.to_i

clubs.each do |club, range|
  if distance >= range 
    puts "Use the #{club}!"
    break
  end
end
