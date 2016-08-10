def Circle
  attr_reader :radius
  def initialize(diameter_or_radius)
    if diameter_or_radius.kind_of?(Hash)
      @radius = diameter_or_radius(:radius) || (diameter_or_radius(:diameter) / 2)
    else
      @radius = diameter_or_radius
    end
  end
end
