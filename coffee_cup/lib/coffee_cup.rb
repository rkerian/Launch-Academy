class CoffeeCup

  attr_reader :capacity
  attr_accessor :amount

  def initialize(amount = 8, capacity = 12)
    @amount = amount
    @capacity = capacity
  end

  def sip(sip_amount)
    if @amount - sip_amount < 0
      @amount = 0
      puts "Hey! You need a refill!"
    else
      @amount -= sip_amount
    end
  end

  def spill(spill_amount)
    if @amount - spill_amount <= 0
      @amount = 0
    else
      @amount -= spill_amount
    end
  end

  def spill!
    @amount = 0
  end

  def refill!
    @amount = @capacity - 2
  end
end
