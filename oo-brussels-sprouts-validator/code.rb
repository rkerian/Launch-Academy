#YOUR CODE GOES HERE
require 'pry'

class Ingredient

  attr_accessor :quantity, :unit
  attr_reader :name

  def initialize(quantity = 0.0, unit = "lb(s)", name)
    @quantity = quantity
    @unit = unit
    @name = name
    @permitted_foods = [
      'brussels sprouts',
      'spinach',
      'eggs',
      'milk',
      'tofu',
      'seitan',
      'bell peppers',
      'quinoa',
      'kale',
      'chocolate',
      'beer',
      'wine',
      'whiskey'
    ]
  end

  def safe?
    @permitted_foods.include?(@name)
  end

  def summary
    puts "#{@quantity} #{@unit} #{@name}"
  end

  class << self

    def parse(input_string)
      ing_array = input_string.split(' ')
      if !ing_array[3].nil?
        #convert ing_array[2] and [3] into name string
        name_string = (ing_array[2] + ' ' + ing_array[3]).to_s
        Ingredient.new(ing_array[0], ing_array[1], name_string)
      else
        Ingredient.new(ing_array[0], ing_array[1], ing_array[2])
      end
    end
  end
end

class Recipe

  attr_reader :name, :instructions, :ingredients

  def initialize(name, instructions, ingredients)
    @name = name
    @instructions = instructions
    @ingredients = ingredients
  end

  def summary
    @warning_flag = false
    puts "Name: #{name}"
    puts "\nIngredients:"
    @ingredients.each do |ingredient|
      print ingredient.summary
      @warning_flag = false if !ingredient.safe?
    end
    puts "Safe to eat?"
    puts  @warning_flag
    puts "\nInstructions:"
    puts @instructions
  end
end

my_booze = [
  Ingredient.parse("1 shot whiskey"),
  Ingredient.parse("1 glass beer")
]

my_recipe = Recipe.new("Booze", "Drink", my_booze)

bad_booze = [
  Ingredient.parse("1 shot vodka"),
  Ingredient.parse("1 shot gin")
]

my_second_recipe = Recipe.new("Bad Booze", "Don't Drink", bad_booze)

name = "Roasted Brussels Sprouts"
instructions = [
  "Preheat oven to 400 degrees F.",
  "Cut off the brown ends of the Brussels sprouts.",
  "Pull off any yellow outer leaves.",
  "Mix them in a bowl with the olive oil, salt and pepper.",
  "Pour them on a sheet pan and roast for 35 to 40 minutes.",
  "They should be until crisp on the outside and tender on the inside.",
  "Shake the pan from time to time to brown the sprouts evenly.",
  "Sprinkle with more kosher salt ( I like these salty like French fries).",
  "Serve and enjoy!"
]

ingredients = [
    Ingredient.new(1.5, "lb(s)", "Brussels sprouts"),
    Ingredient.new(3.0, "tbspn(s)", "Good olive oil"),
    Ingredient.new(0.75, "tspn(s)", "Kosher salt"),
    Ingredient.new(0.5, "tspn(s)", "Freshly ground black pepper")
]

recipe = Recipe.new(name, instructions, ingredients)
puts recipe.summary


# binding.pry
