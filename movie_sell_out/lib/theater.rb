class Theater

  attr_reader :seats
  attr_accessor :patrons

  def initialize(seats, patrons = 0)
    @seats = seats
    @patrons = patrons
  end

  def admit!(people = 1)
    if @patrons + people <= @seats
      @patrons += people
    else
      "Too many people."
    end
  end

  def at_capacity?
    @patrons == @seats ? true : false
  end

  def record_walk_outs!(angry_people)
    @patrons -= angry_people
  end

end
