require 'Dwelling'

class Apartment < Dwelling
  require_relative 'handle_items'
  include HandleItems
  require 'Date'

  attr_reader :rent, :lease_start_date, :lease_end_date, :inventory

  def initialize(address, city_or_town, state, zip_code,
      rent, lease_start_date, lease_end_date)
    super(address, city_or_town, state, zip_code)
    @rent = rent
    @lease_start_date = Date.parse(lease_start_date)
    @lease_end_date = Date.parse(lease_end_date)
    @inventory = []
    @max_inventory = 4
  end
end
