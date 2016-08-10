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

puts "***Automated Golf Club Advice:***"

possible_club_selections.each do |selection|
  puts "Use the #{selection.to_s.gsub("_", " ")}!"
end

puts ""

REQUIRED_CLUBS = [:driver, :pitching_wedge, :putter]

missing_required_clubs = REQUIRED_CLUBS - possible_club_selections
missing_required_clubs.each do |required_club|
  puts "WARNING! You will be without a #{required_club.to_s.gsub("_", " ")}"
end

