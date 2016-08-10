class Cell

  attr_reader :mined, :covered

  def initialize(mined = false)
    @mined = mined
    @covered = true
  end

  def uncover
    @covered = false
  end

  def clear?
    @mined == false ? true : false
  end

  def toggle_type
    # @type == true ? @type = false : @type = true
    @mined = !@mined
  end
end
