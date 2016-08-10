require_relative 'pizza.rb'
require 'pry'

puts "Welcome to the pizza shop."
my_pizza = Pizza.new([:pepperoni])
binding.pry
