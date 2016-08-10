require_relative 'cage'
require_relative 'employee'
require_relative 'zoo_at_capacity'
require 'pry'

class Zoo

  attr_reader :name, :season_opening_date, :season_closing_date, :cages,
    :employees

  def initialize(name, season_opening_date, season_closing_date)
    @name = name
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date
    @cages = Array.new(10) { Cage.new }
    # 10.times { @cages << Cage.new }
    @employees = []
  end

  def add_employee(name)
    @employees << name
  end

  def open?(date)
    date >= @season_opening_date && date <= @season_closing_date ? true : false
  end

  def add_animal(new_animal)
    replace_index = @cages.find_index { |cage| cage.empty? }
    if !replace_index.nil?
      @cages[replace_index].animal = new_animal
    else
      raise ZooAtCapacity
    end
  end

  def visit
    speaks = []
    @employees.each { |employee| speaks << employee.greet }
    @cages.map do |cage|
      if !cage.empty?
        speaks << cage.animal.speak
      end
    end
    speaks.join("\n")
  end
end
