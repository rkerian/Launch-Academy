require_relative 'deck'

class Hand

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def add_card(new_card)
    @cards += new_card
  end

  def calculate_hand
    # Your code here after writing tests
    # Think about what this method needs to do
    total = 0
    ace_count = 0
    count_array = []
    #first, let's take each card and get its value
    #into an array
    @cards.each_with_index.map do |card, index|
      current_card = card.rank
      if current_card == 'K' || current_card == 'Q' || current_card == 'J'
        count_array << 10
      elsif current_card == 'A'
        ace_count += 1
        count_array << 11
      else
        count_array << current_card.to_i
      end
    end
      #now, let's add up each value in the array
      #to get total hand value, regardless of whether there are aces in hand
      count_array.map do |card|
        total += card
      end
      #now, we need special logic to deal with aces
      #no need to revalue if <= 21 or no aces
      until total <= 21 || ace_count == 0
        total -= 10
        #we can value aces at 1 instead of 11
        ace_count -= 1
        #but only for the number of aces in hand
      end
    total
  end
end
