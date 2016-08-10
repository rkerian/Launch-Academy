class Movie

attr_reader :name, :genre, :time

  def initialize(name, genre, time)
    @name = name
    @genre = genre
    @time = Time.parse(time)
  end

  def showing_after?(arrival_time)
    @arrival_time = Time.parse(arrival_time)
    @time >= @arrival_time ? true : false
  end

  def comedy?
    @genre == :Comedy ? true : false
  end

  def showing_between?(start_time, end_time)
    @start_time = Time.parse(start_time)
    @end_time = Time.parse(end_time)
    @time >= @start_time && @time <= @end_time ? true : false
  end
end
