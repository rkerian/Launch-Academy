require_relative 'deck.rb'

class Card
  #a card consists of a suit and a rank
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
end
