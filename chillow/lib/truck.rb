class Truck

  require_relative 'handle_items'
  include HandleItems

  attr_reader :max_inventory, :inventory

  def initialize
    @max_inventory = 10
    @inventory = []
  end
end
