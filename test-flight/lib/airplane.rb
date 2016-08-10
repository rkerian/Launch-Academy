class Airplane

  attr_reader :type, :wing_loading, :horsepower

  def initialize(type, wing_loading, horsepower)
    @type = type
    @wing_loading = wing_loading
    @horsepower = horsepower
    @engine_running = false
    @flying = false
    @landed = true
    @fuel = 10
  end

  def start
    if @engine_running
       'airplane already started'
    else
      if fueled?
        @engine_running = true
        'airplane started'
      else
        'low fuel, cannot start!'
      end
    end
  end

  def takeoff
    if @flying
      'airplane already flying'
    else
      if @engine_running
        if fueled?
          @flying = true
          @landed = false
          'airplane launched'
        else
          'low fuel, cannot takeoff!'
        end
      else
        'airplane not started, please start'
      end
    end
  end

  def land
    if @flying
      if fueled?
        @landed = true
        @flying = false
        'airplane landed'
      else
        'low fuel, prepare for emergency landing'
      end
    else
      'airplane is not flying'
    end
  end

  def fueled?
    @fuel >= 1 ? true : false
  end

  def refuel
    @fuel = 10
  end

  def empty
    @fuel = 0
  end
end
