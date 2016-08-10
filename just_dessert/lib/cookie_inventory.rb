class CookieInventory

  attr_accessor :varieties

  def initialize
    @varieties = {
      :peanut_butter => 0,
      :chocolate_chip => 0,
      :sugar => 0
    }
  end

  def bake_tray(type, quantity)
    if @varieties.include?(type)
      @varieties[type] += quantity
    else
      "We don't make those cookies, bro."
    end
  end

  def sell!(type, quantity)
    if @varieties[type] >= quantity
      @varieties[type] -= quantity
    else
      "Sold out!"
    end
  end


end
