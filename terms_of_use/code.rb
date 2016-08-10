require 'pry'

def disclaimer
  puts "***DISCLAIMER***\nThis code may not work the way you expect it to.
By using this temperamental program, you agree not to
sue the pants off of its creator. \n***"
  user_choice = "no no no"
  while user_choice != 'y' && user_choice != 'yes'
    puts "You must accept this disclaimer to continue. Do you accept? (y/n)"
    user_choice = gets.strip.downcase
  end
end

disclaimer

puts "3 + 2 = #{rand(6)}"

disclaimer
