REQUIRED_BAG_SIZE = 10

available_clubs = [
  :two_iron,
  :three_iron,
  :four_iron,
  :five_iron,
  :six_iron,
  :seven_iron,
  :eight_iron,
  :nine_iron,
  :pitching_wedge,
  :sand_wedge,
  :driver,
  :three_wood,
  :five_wood,
  :seven_wood,
  :putter
]

possible_club_selections = available_clubs.sample(REQUIRED_BAG_SIZE)

possible_club_selections.each_with_index do |club, index|
  possible_club_selections[index] = club.to_s.gsub('_', ' ')
end

puts "Automated Golf Club Advice:"
possible_club_selections.each do |club|
  puts "Use the #{club}!"
end

if !possible_club_selections.include?('pitching wedge')
  puts "WARNING! You will be without a pitching wedge!"
end

if !possible_club_selections.include?('putter')
  puts "WARNING! You will be without a putter!"
end

if !possible_club_selections.include?('driver')
  puts "WARNING! You will be without a driver!"
end
