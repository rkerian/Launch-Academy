# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')



5.times do
  Meetup.create(name: Faker::Space.agency, description: Faker::Space.galaxy, creator: 1, location: "Raleigh, NC")
end

2.times do
  Event.create(id: 1, title: Faker::Hipster.sentence, description: Faker::Hipster.sentence(3), location: "#{Faker::Address.street_address},
   #{Faker::Address.city}, #{Faker::Address.zip_code}, #{Faker::Address.state_abbr}")
end
