## Part I

With all this programming, you deserve a night out! First, we'll start at the
local pizza joint, where they've asked you to place your order in Ruby (kinda weird, but it gets you a discount, so why not?)

To do so, you'll have to design your `Pizza` class. By default, the chef will
assume you'd like a `:cheese` pizza.

Optionally, you can decide if you want your pizza to also have any combination
of `:pepperoni`, `:bacon`, `:sausage`, `:mushroom`, `:onion`, 
`:jalapeno`, or `:green_pepper`.

In order for the legendary chef to cook your pizza, he needs to know what
ingredients you would like, so be sure to make your ingredients available to
outside callers.

{% show_hint %}
* Consider how you store lists. How can you use a list construct your `Pizza`
    instances?
{% endshow_hint %}

## Part II

Define a `cost` instance method that helps you to determine how much your pizza will
cost. A pizza costs a base of **$8.00**, and each topping costs the following:

```no-highlight
Cheese: $0.10
Green Pepper: $0.30
Onion: $0.50
Mushroom: $0.70
Pepperoni: $1.10
Jalapeno: $1.30
Sausage: $1.70
Bacon: $1.90
```

## Part III

It would be easier for the chef if you could separate your order between `meats`
(`:sausage`, `:pepperoni`, `:bacon`)
and other toppings (`:cheese`, `:green_pepper`, `:onion`, `:mushroom`,
`:jalepeno`). 
We can call those toppings `other_toppings` and include Mushrooms and Cheese as part
of that group. Define two instance methods that will provide the chef with the toppings in a given category when constructing your pizza.

{% show_solution %}
```ruby
class Pizza
  attr_accessor :selection

  TOPPINGS = {
    cheese: 0.10,
    green_pepper: 0.30,
    onion: 0.50,
    mushroom: 0.70,
    pepperoni: 1.10,
    jalapeno: 1.30,
    sausage: 1.70,
    bacon: 1.90
  }

  def initialize(selection=[:cheese])
    @selection = selection
    @meats = meats
    @other_toppings = other_toppings
  end

  def cost
    @cost = 8.00
    @selection.each do |topping|
      @cost += TOPPINGS[topping]
    end
    @cost
  end

  def meats
    @meats = @selection & [:sausage, :pepperoni, :bacon]
  end

  def other_toppings
    @other_toppings = @selection & [:cheese, :green_pepper, :onion, :mushroom, :jalepeno]
  end

  def self.toppings
    TOPPINGS.each do |topping, cost|
      puts "#{topping.to_s.gsub('_',' ')} - $#{'%.2f' % cost}"
    end
  end
end
```
{% endshow_solution %}
