require 'animal'

class Python < Animal
  include Reptile

  def initialize(name)
    super(name)
  end

  def speak
    "SSSSssssss..."
  end
end
