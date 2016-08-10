def average(first, second, third, fourth, fifth)
  sum = ((first + second + third + fourth + fifth) / 5).to_f
  if sum >= 90
    puts "A: #{sum}"
  elsif sum >= 80
    puts "B: #{sum}"
  elsif sum >= 70
    puts "C: #{sum}"
  elsif sum >= 60
    puts "D: #{sum}"
  else
    puts "Failure: #{sum}"
  end
end
average(80,80,80,80,80)

def rankings(students)
  grading_array = []
  grading_array << students
  grading_array.each_with_index do |name, index|
    puts "#{name} is number #{index+1}!"
  end
end
