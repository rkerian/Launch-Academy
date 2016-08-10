class BoundingBox

  attr_reader :width, :height

  def initialize(x, y, width, height)
    @x = x
    @y = y
    @width = width.to_f
    @height = height.to_f
  end

  def left
    @x
  end

  def right
    @x + @width
  end

  def top
    @y + @height
  end

  def bottom
    @y
  end

  def contains_point?(x_input, y_input)
    if x_input < self.left || x_input > self.right
      false
    elsif y_input < self.bottom || y_input > self.top
      false
    else
      true
    end
  end


end
