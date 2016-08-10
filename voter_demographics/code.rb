require 'pry'

voters =
{
  'Jon Smith' => {
    :age => 25,
    :income => 50000,
    :household_size => 1,
    :gender => 'Male',
    :education => 'College'
},
  'Jane Davies' => {
    :age => 30,
    :income => 60000,
    :household_size => 3,
    :gender => 'Female',
    :education => 'High School'
},
  'Sam Farelly' => {
    :age => 32,
    :income => 80000,
    :household_size => 2,
    :gender => 'Unspecified',
    :education => 'College'
},
  'Joan Favreau' => {
    :age => 35,
    :income => 65000,
    :household_size => 4,
    :gender => 'Female',
    :education => 'College'
},
  'Sam McNulty' => {
    :age => 38,
    :income => 63000,
    :household_size => 3,
    :gender => 'Male',
    :education => 'College'
},
  'Mark Minahan' => {
    :age => 48,
    :income => 78000,
    :household_size => 5,
    :gender => 'Male',
    :education => 'High School'
},
  'Susan Umani' => {
    :age => 45,
    :income => 75000,
    :household_size => 2,
    :gender => 'Female',
    :education => 'College'
},
  'Bill Perault' => {
    :age => 24,
    :income => 45000,
    :household_size => 1,
    :gender => 'Male',
    :education => 'Did Not Complete High School'
},
  'Doug Stamper' => {
    :age => 45,
    :income => 75000,
    :household_size => 1,
    :gender => 'Male',
    :education => 'College'
},
  'Francis Underwood' => {
    :age => 52,
    :income => 100000,
    :household_size => 2,
    :gender => 'Male',
    :education => 'College'
}
  }

sum_of_income = 0
sum_of_ages = 0
sum_of_household = 0

#tracking all values separately in case of data error/missing data
#rather than just counting voter names

ages = []
incomes = []
house_sizes = []

male = 0
female = 0
unspecified = 0
total_genders = 0
college = 0
high_school = 0
no_education = 0

voters.each do |key, value|
  ages << value[:age]
  sum_of_ages += value[:age]

  incomes << value[:income]
  sum_of_income += value[:income]

  house_sizes << value[:household_size]
  sum_of_household += value[:household_size]

  if value[:gender] == 'Male'
    male += 1
  elsif value[:gender] == 'Female'
    female +=1
  else
    unspecified += 1
  end

  if value[:education] == 'College'
    college += 1
  elsif value[:education] == 'High School'
    high_school += 1
  else
    no_education +=1
  end
end

#Display average age of voters
puts "Average age: #{sum_of_ages / ages.count}"

#Display average income of voters
puts "Average income: #{sum_of_income / incomes.count}"

total_genders = (male + female + unspecified).to_f

#Display female percentage
puts "Female Percentage = #{(female / total_genders) * 100}"

#Display male percentage
puts "Male Percentage = #{(male / total_genders) * 100}"

#Display unspecified percentage
puts "Unspecified Percentage = #{(unspecified / total_genders) * 100}"

total_education = (college + high_school + no_education).to_f

#displays College percentage
puts "College Percentage = #{(college / total_education) * 100}"

#displays High School percentage
puts "HS Percentage = #{(high_school / total_education) * 100}"

#Displays No education
puts "Didn't finish HS = #{(no_education / total_education) * 100}"
