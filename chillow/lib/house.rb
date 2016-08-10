require 'Dwelling'

class House < Dwelling
  require_relative 'dwelling'

  attr_reader :asking_price

  def initialize(address, city_or_town, state, zip, asking_price)
    super(address, city_or_town, state, zip)
    @asking_price = asking_price
  end
end
