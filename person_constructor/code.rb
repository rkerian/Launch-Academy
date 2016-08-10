require 'pry'
class Person
  attr_reader :first_name, :last_name
  def initialize(full_or_first_name, last_name = nil)
    if last_name.nil?
      name_array = full_or_first_name.split(' ')
      @first_name = name_array[0]
         if !name_array[2].nil?
           @middle_name = name_array[1].to_s
           @last_name = name_array[2].to_s
         else
           @last_name = name_array[1].to_s
         end
    else
      @first_name = full_or_first_name
      @last_name = last_name
    end
  end
end
binding.pry
