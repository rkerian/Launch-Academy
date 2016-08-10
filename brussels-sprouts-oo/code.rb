#YOUR CODE GOES HERE
require 'pry'

class Ingredient

  attr_accessor :quantity, :unit
  attr_reader :name

  def initialize(quantity = 0.0, unit = "lb(s)", name)
    @quantity = quantity
    @unit = unit
    @name = name
  end

  def summary
    puts "#{@quantity} #{@unit} #{@name}"
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
    puts "Name: #{name}"
    puts "\nIngredients:"
    @ingredients.each do |ingredient|
      print ingredient.summary
    end
    puts "\nInstructions:"
    puts @instructions
  end
end

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

cookies = "Best Big, Fat, Chewy Chocoloate Chip Cookie"
cookie_ingredients = [
  Ingredient.new(2, "cups", "Flour"),
  Ingredient.new(0.5, "tbsp", "Baking Soda"),
  Ingredient.new(0.5, "tbsp", "Salt"),
  Ingredient.new(0.75, "cups", "Butter"),
  Ingredient.new(0.5, "cups", "White Sugar"),
  Ingredient.new(1, "tbsp", "Vanilla Extract"),
  Ingredient.new(1, "large", "Egg")
]
cookie_instructions = [
  "1. Preheat the oven to 325 degrees F (165 degrees C). Grease cookie sheets or line with parchment paper.",
  "2. Sift together the flour, baking soda and salt; set aside.",
  "3. In a medium bowl, cream together the melted butter, brown sugar and white sugar until well blended.
      Beat in the vanilla, egg, and egg yolk until light and creamy. Mix in the sifted ingredients until just blended.
      Stir in the chocolate chips by hand using a wooden spoon. Drop cookie dough 1/4 cup at a time onto the
      prepared cookie sheets. Cookies should be about 3 inches apart.",
  "4. Bake for 15 to 17 minutes in the preheated oven, or until the edges are lightly toasted.
      Cool on baking sheets for a few minutes before transferring to wire racks to cool completely."
]


recipe_two = Recipe.new(cookies, cookie_instructions, cookie_ingredients)
recipe_two.summary
