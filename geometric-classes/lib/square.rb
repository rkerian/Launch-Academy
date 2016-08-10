class Square

  attr_reader :x, :y, :length

  def initialize(length, x = 0, y = 0)
    @length = length
    @x = x
    @y = y
  end

  def width
    length
  end

  def diameter
    length * Math::sqrt(2)
  end

  def area
    length**2
  end

  def perimeter
    length * 4
  end

  def contains_point?(a,b)
    #check left
    delta = length / 2.0
    if a < x - delta
      false
    #check right
    elsif a > x + delta
      false
    #check top
    elsif b > y + delta
      false
    #check bottom
    elsif b < y - delta
      false
    else
      true
    end
  end

  # Richard's better way
  # def contains_point?(a, b)
  #   delta = length / 2.0
  #   if x - delta <= a && a <= x + delta &&
  #     y - delta <= b && b <= y + delta
  #     return true
  #   else
  #     return false
  #   end
  # end
end
