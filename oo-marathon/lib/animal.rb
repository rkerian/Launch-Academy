class Animal

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{@name}"
  end
end
