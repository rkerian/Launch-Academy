class Pizza
  attr_reader :toppings, :other_toppings, :cost

  def initialize(ordered_ingredients = [:cheese])
    @toppings = []
    @other_toppings = []
    # @ordered_ingedients = ordered_ingedients
    @regular_ingredients = [
      {:mushroom => 0.70
      },
        {:onion => 0.50
      },
        {:jalapeno => 1.30
      },
        {:green_pepper => 0.30
      },
        {:cheese => 0.10
      }
    ]
    @meats = [
      {:pepperoni => 1.10
    },
      {:bacon => 1.90
    },
      {:sausage => 1.70
    }
      ]

    ordered_ingredients.each do |ingredient|
      if @regular_ingredients[0].include?(ingredient)
        @toppings << ingredient
      elsif @meats[0].include?(ingredient)
        @other_toppings << ingredient
      else
      puts "We don't have #{ingredient}."
      end
    end
  end

  def cost
    @cost = 8.00
    toppings.each do |topping|
      @cost += @regular_ingredients[0][topping] if !@regular_ingredients[0][topping].nil?
    end
    other_toppings.each do |topping|
      @cost += @meats[0][topping] if !@meats[0][topping].nil?
    end
    @cost
  end
end
