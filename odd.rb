my_array = [*1..100]

my_array.each do |x|
    if x % 15 == 0
      puts "Fizzbuzz"
    elsif x % 5 == 0
      puts "Buzz"
    elsif x % 3 == 0
      puts "Fizz"
    else
      puts x
    end
end
