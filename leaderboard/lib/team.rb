class Team
  # YOUR CODE GOES HERE
  attr_reader :name, :wins, :losses
  attr_accessor :rank

  def initialize(name, rank = nil)
    @name = name
    @rank = rank
    @wins = 0
    @losses = 0
  end

  def add_win
    @wins += 1
  end

  def add_loss
    @losses += 1
  end
end
