########################
## Variables Exercise ##
########################

=begin

You are going on a family vacation to The Galapagos Islands and need to
save some information for the trip.  In order to recall the details of the
trip later you decide to write a ruby program that will store the information.
The program will have trip itinerary details as well as fun things from the trip
so the next time you go the Galapagos you can remember your favorite spots.

Use variables in ruby to store: date you leave, date you return home, hotel name,
number of iguanas you see, name of favorite beach, and number of giant tortoises you see.

(Choose a number for how many iguanas/tortoises you've seen and make
up the dates/names of the other variables)

=end

# Solution:
leaving_date = "March 13th"
return_date = "May 1st"
hotel_name = "BestWestern"
iguana_count = 200
favorite_beach = "Tortuga Bay"
tortoise_count = 40

############################
## Interpolation Exercise ##
############################

=begin

During the trip you saw over 200 iguanas and 40 tortoises!  Now it's time to write the
ruby program that will give a summary of your trip.  The goal of the program is to
write to the terminal an overview of all the sightings and start/end date of the trip.
Normally you can use the '+' method to combine strings together.  For this program
you should take advantage of Ruby's String Interpolation feature.  The summary should
include the start date, end date, hotel you stayed at, favorite beach, and the total
number of animals you saw.  For example:

Example Output:
'We left March 13th for The Galapagos Islands and stayed at the BestWestern hotel.  During
the trip I saw over 240 animals. My favorite beach during the trip was Tortuga Bay.
After an amazing trip we returned on May 1st.  Can't wait to go back!'

Hints:
- Think about different ways of forming a big string in ruby
- Research if ruby has ways of making multi-line strings that allow for interpolation
- Remember only certain types of strings allow interpolation!
- Example of Using string interpolation: "#{10 + 10} is equal to 20."  # => "20 is equal to 20."

=end

# Solution
summary = <<-EOH
We left #{leaving_date} for The Galapagos Islands and stayed at the #{hotel_name} hotel.  During
the trip I saw over #{iguana_count + tortoise_count} animals! My favorite beach during the trip was #{favorite_beach}.
After an amazing trip we returned on #{return_date}.  Can't wait to go back!
EOH

puts summary

############################
##    Boolean Exercise    ##
############################

# ideas: sailing, buying gifts, adventuring animal reserve
# make use of <, >, ==, !=


=begin
During the trip your younger brother Johnny, who LOVES animals, decided to keep
track of how many of each animal he saw.  Given the number of animals he saw,
write some ruby expressions that will put to the screen true or false based
on the statements.

Example Output:
1. Johnny saw more iguanas than tortoises.
true

2. Johnny saw more crabs than ants.
false

3. Johnny saw the same amount of albatross's as ants.
false

4. Johnny saw less crabs than tortoises.
false

Use Ruby's equality symbols to test the variables below:
=end

iguanas = 200
tortoises = 40
albatross = 375
ants = 900
crabs = 60
blue_footed_booby = 20
dolphin = 35

# Solution
puts "1.  Johnny saw more iguanas than tortoises."
puts iguanas > tortoises

puts "2.  Johnny saw more crabs than ants"
puts crabs > ants

puts "3.  Johnny saw the same amount of albatross's as ants."
puts albatross == ants

puts "4.  Johnny saw less crabs than tortoises."
puts crabs < tortoises

############################
## Flow Control Exercise  ##
############################

=begin

On the third night, you and your family go to this cute restaurant called the IslaGrill.  After a
delicious meal your parents ask you to write a quick Ruby program to calculate potential tips
for the waiter.  The total cost of the meal was $178.  They would like to know how much tip to give
for 15%, 18%, 20%, and 25%.

You are given a 'tip' variable that has a random tip percentage in the form of an integer.  Use that tip
variable and flow control in order to calculate the proper tips.

Hints:
- Make sure to use Floats when dealing with money

=end

# Given:
tip = [15, 18, 20, 25].sample # will return a random tip between 15 and 25

# your code here:

############
# Solution #
############

if tip == 15
  puts 178 * 0.15
elsif tip == 18
  puts 178 * 0.18
elsif tip == 20
  puts 178 * 0.20
elsif tip == 25
  puts 178 * 0.25
end

############################
#  Random Number Exercise  #
############################

=begin

On the fourth night, you and your family can't decide which crazy adventure to go on: sailing,
animals reservation, or jet skiing.  You are tasked with creating a program that will decide
which adventure to go on.  Figure out how to create a random number that will pick the different
activities.  So if 1 is picked you go sailing, 2 you go to the animal reservation, and 3 you go jet
skiing. Make the program write to the screen which adventure was chosen.

=end

############
# Solution #
############

number = rand(3) + 1

if number == 1
  puts "Sailing!"
elsif number == 2
  puts "Animal reservation!"
else
  puts "Jet skiing!"
end

########################
#    Binding Pry       #
########################

=begin
Goals:
- given some code with binding.prys commented out
- figure out what the errors are
- uncomment out the binding.pry
- fix the errors by using pry

Topics:
- volcano hike
=end

=begin
The last day of your trip you decide to hike the Volcano Sierra Negra (Isabela Island).
There are specific directions you need to take in order to get to this amazing
hot springs.

The Directions Are:
1.  Follow the main path until you reach the turtle statue.
2.  Take a right at the turtle statue and continue a few miles.
3.  When you see a long set of stairs start heading up those.
4.

=end


