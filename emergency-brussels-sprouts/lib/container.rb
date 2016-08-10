class Container

  attr_reader :weight, :max_weight, :ingredient
  attr_accessor :ingredients

  def initialize(weight, max_weight)
    @weight = weight
    @max_weight = max_weight
    @ingredients = []
    @amount = nil
  end

  def maximum_holding_weight
    @max_weight
  end

  def which_ingredient
    @ingredients[0].name
  end

  def fill_with_ingredient(ingredient)
    if ingredient.name == 'Brussels Sprout' || ingredient.name == 'Brussels Sprouts'
      @ingredients.fill(ingredient, 0, 7000)
    else
      @ingredients.fill(ingredient, 0, 20000)
    end
  end

  def how_many_ingredients
    @ingredients.count
  end

  def remove_one_ingredient
    @ingredients = @ingredients.drop(1)
  end

  def empty
    @ingredients = []
  end

  def weight
      if @ingredients.empty?
        @weight
      else
      ingredient_weight = @ingredients.count * @ingredients[0].weight
      ingredient_weight.to_i + @weight
      end
  end
end
