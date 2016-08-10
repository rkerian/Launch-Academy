class Ingredient

  attr_reader :name, :weight

  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  # def count
  #   if name == 'Brussels Sprouts'
  #     amount = (weight * 1000) / 20.to_i
  #   else
  #     amount = (weight * 1000) / 0.5.to_i
  #   end
  # end

  def self.create_from_grams(name, grams)
    weight = grams / 1000.00
    Ingredient.new(name, weight)
  end
end
