require_relative 'board'

class Position

  attr_reader :name

  def initialize(name = nil)
    @name = name
  end

  def occupied?
    !@name.nil?
  end

  def fill_position(player)
    @name = player
  end
end
