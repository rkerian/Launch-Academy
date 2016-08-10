require 'pry'
class Student

  attr_reader :first_name, :last_name, :grades

  def initialize(info)
    @first_name = info[:first_name]
    @last_name = info[:last_name]
    @grades = info[:grades]
    @average = average
  end

  def average
    sum = 0.0
    @grades.each { |grade| sum += grade }
    sum / @grades.count
  end
end
binding.pry
